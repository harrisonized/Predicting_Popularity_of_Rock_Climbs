import re
import json
import math
import time
import random
import pandas as pd
import bs4
import requests
from tqdm.notebook import tqdm

pd.set_option('mode.chained_assignment', None)


# Objects included in this file:

# Functions included in this file:
# # title_to_snake_case
# # snake_to_pascal_case
# # dict_to_col


def title_to_snake_case(text):
    """Converts "Column Title" to column_title
    """
    return text.lower().replace(' ', '_').replace('-', '_')


def snake_to_pascal_case(text):
    """Converts column_title to ColumnTitle
    """
    return ''.join(map(lambda x: x.capitalize(), text.split('_')))


def add_space_to_prefix(text, prefixes: list):
    prefix_regex = '('+'|'.join(prefixes)+')'
    return re.sub(prefix_regex, r'\1 ', text)


def dict_to_col(df, col: str, to_include=False, prefix=None):
    """Expands a single dataframe column containing dictionaries into columns.
    Input:
    idx_1 | ... | new_col
    ------+-----+--------------------------------------
    idx_1 | ... | {'key_1': val_1, 'key_2': val_2, ...}

    Returns:
    idx_0 | ... | key_1 | key_2 | ...
    ------+-----+-------+-------+-----
    val_0 | ... | val_1 | val_2 | ...
    """
    df = df.reset_index(drop=True) # required for this to work correctly
    if prefix:
        df = df.join(df[col].apply(lambda x: pd.Series(x).add_prefix(f'{prefix}_')))
    else:
        df = df.join(df[col].apply(pd.Series))
    
    if to_include:
        return df
    else:
        return df.drop(columns=[col])
