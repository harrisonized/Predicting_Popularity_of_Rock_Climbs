import re
import json
import math
import time
import random
import pandas as pd
import bs4
import requests
from tqdm.notebook import tqdm
from .formatting.text_tools import title_to_snake_case
from .pandas.data import dict_to_col

pd.set_option('mode.chained_assignment', None)


# Objects included in this file:
# grades_converter

# Functions included in this file:
# # preprocess
# # get_ratings_from_mp
# # transform_features


grades_converter = {'V-easy': -1, 'V-easy PG13': -1, '5.9 V-easy': -1, 'V-easy R': -0.75,
                    'V0-': -0.25, '5.9 V0-': -0.25, 'V0- PG13': -0.25, 'V0- R': -0.25,
                    '5.8+ V0': 0, '5.9 V0': 0, 'V0': 0, 'V0 PG13': 0,
                    '5.10a V0 R': 0.25, 'V0 R': 0.25, 'V0 X': 0.25, '5.8+ V0 X': 0.25, 'V0+': 0.25, 'V0+ PG13': 0.25,
                    'V0+ R': 0.5, 'V0-1': 0.5, '5.10- V0-1': 0.5,
                    'V1-': 0.75, 'V1': 1, 'V1 PG13': 1, '5.9 V1': 1,
                    'V1 R': 1.25, 'V1 X':1.25, 'V1+': 1.25, 'V1+ PG13': 1.25, 'V1-2': 1.5, 
                    'V2-': 1.75, '5.10+ V2': 2, 'V2': 2, 'V2 PG13': 2, '5.11b V2': 2,
                    'V2 R': 2.25, 'V2+': 2.25, 'V2-3': 2.5, '5.10- V2-3': 2.5, 'V2+ X': 2.5, 
                    'V3-': 2.75, 'V3- R': 3, 'V3': 3, 'V3 PG13': 3,
                    'V3 R': 3.25, '5.11c V3 R': 3.25, 'V3+': 3.25, 'V3+ R':3.5, 'V3-4': 3.5,
                    'V4-': 3.75, 'V4': 4, 'V4 PG13': 4,
                    'V4 R': 4.25, 'V4 X': 4.25, 'V4+': 4.25, 'V4+ PG13': 4.25, 'V4-5': 4.5,
                    'V5-': 4.75, 'V5': 5, 'V5 PG13': 5, '5.12c V5 X': 5,
                    'V5 R': 5.25, 'V5+': 5.25, 'V5+ X': 5.5, 'V5-6': 5.5,
                    'V6-': 5.75, 'V6- PG13': 5.75, 'V6- R': 6, 'V6': 6, 'V6 PG13': 6,
                    'V6 R': 6.25, 'V6+': 6.25,  'V6-7': 6.5, 'V6-7 PG13': 6.5, 
                    'V7-': 6.75, 'V7': 7, 'V7 PG13': 7,
                    'V7 R': 7.25, 'V7+':7.25, 'V7-8': 7.5,   
                    'V7-8 R': 7.75, 'V8-': 7.75, 'V8': 8, 'V8 PG13': 8,
                    'V8 R':8.25, 'V8 X': 8.25, 'V8+': 8.25, 'V8-9': 8.5, 
                    'V9-': 8.75, 'V9': 9, 'V9 PG13': 9,
                    'V9 R': 9.25, 'V9+': 9.25, 'V9+ PG13': 9.25, 'V9 X': 9.25, 'V9-10':9.5, 'V9-10 PG13': 9.5, 
                    'V10-': 9.75, 'V10': 10, 'V10 PG13': 10,
                    'V10 R': 10.25, 'V10 X': 10.25, 'V10+': 10.25,  'V10-11': 10.5, 'V10-11 PG13': 10.5,
                    'V11-': 10.75, 'V11': 11,
                    'V11 R': 11.25, 'V11 X': 11.25, 'V11-12': 11.5,
                    'V12-': 11.75, 'V12': 12, 'V12 PG13': 12,
                    'V12+': 12.25, 'V12-13 R': 12.5,
                    'V13': 13,  'V13 PG13': 13, 'V13 R': 13.25, 'V13-14 PG13': 13.5,
                    'V14': 14}  # should find a way to generate these automatically


def preprocess(df, grade_converter):
    """Use this to clean data prior to storage in postgres
    """
    # format columns names
    df.columns = [title_to_snake_case(col) for col in df.columns]
    df = df.rename(columns = {"length": "length_"})
    
    # Collect the route ID (to ensure there are no duplicates)
    df['url_id'] = df['url'].apply(lambda x: re.sub("https://www.mountainproject.com/route/", "",  x)) 
    df['url_id'] = df['url_id'].apply(lambda x: int(re.sub("/(?<=/).*", "",  x)))
    
    # Fix bad avg_stars rating
    df.avg_stars = df.avg_stars.replace(to_replace = -1.0, value = 0) 
    
    # Convert V grades into numerical values
    df['grade'] = df.rating.replace(grade_converter)
    
    return df


def get_ratings_from_mp(df):
    """Uses the link provided in the CSV file to open and grab data from the following categories:
    Star Ratings, Suggested Ratings, On To Do Lists, and Ticks
    """
    
    df["ratings"] = None  # add empty column to df
    
    # Chose to do it this way to prevent potential auto-ban
    for row in tqdm(df.iterrows()):

        # url
        url = row[1]['url']
        url_items = re.match('https://www.mountainproject.com/route/(?P<url_id>\d+)/(?P<route>.*)', url)
        url_id, route = url_items['url_id'], url_items['route']
        route_stats_url = f'https://www.mountainproject.com/route/stats/{url_id}/{route}'

        # get data
        html = bs4.BeautifulSoup((requests.get(route_stats_url).text), "lxml")
        h3_sections = list(html.find('div', {"id":"route-stats"}).find_all("h3"))  # ratings only
        ratings = {title_to_snake_case(h3_section.contents[0].strip()): int(h3_section.contents[1].text)
                   for h3_section in h3_sections}

        # add data to df
        df.loc[row[0], ['ratings']] = json.dumps(ratings)
        
        # Delay is 1.5 +/- 1.0 s, so code should run for about 10-15 min for 400 rows
        time.sleep(.5+2*random.random()) # Delay by average of 2.5 seconds, at least 0.5 seconds between clicks
        
    df['ratings'] = df['ratings'].apply(json.loads)
    df = dict_to_col(df, 'ratings')

    return df


def transform_features(df):
    """ Add log and sqrt values
    """
    # add log values for ols linear regression
    df['log_star_ratings'] = df['star_ratings'].apply(lambda x: math.log(x+1, 10))
    df['log_ticks'] = df['ticks'].apply(lambda x: math.log(x+1, 10))
    df['log_avg_stars'] = df['avg_stars'].apply(lambda x: math.log(x+1, 10))
    df['log_length'] = df['length_'].apply(lambda x: math.log(x+1, 10))
    df['log_grade'] = df['grade'].apply(lambda x: math.log(x+2, 10))
    df['log_on_to_do_lists'] = df['on_to_do_lists'].apply(lambda x: math.log(x+1, 10)) # Target
    
    # add sqrt values for Poisson regression
    df['sqrt_star_ratings'] = df['star_ratings'].apply(lambda x: math.sqrt(x))
    df['sqrt_ticks'] = df['ticks'].apply(lambda x: math.sqrt(x))
    df['sqrt_avg_stars'] = df['avg_stars'].apply(lambda x: math.sqrt(x))
    df['sqrt_length'] = df['length_'].apply(lambda x: math.sqrt(x))
    df['sqrt_grade'] = df['grade'].apply(lambda x: math.sqrt(x+1))
    
    return df
