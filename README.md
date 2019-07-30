# Predicting Popularity of Rock Climbs

For this project, I used regression techniques on data from [Mountain Project](https://www.mountainproject.com) to predict the number of users who would have a particular rock climb on their to-do-list.

First, I acquired and cleaned the data according to the following steps.

1. Download data for boulder problems in the Bishop and Joshua Tree areas (available in csv format).
2. Clean the data by standardizing column names and deriving new columns from the old ones (eg. getting the url_id from the url)
3. Scrape the data for the missing features (star_ratings, suggested_ratings, on_to_do_lists, ticks)
4. Create log and sqrt transformations of the features and target

When I did the project the first time, I used Pandas exclusively and exported the data after each step in separate CSV files. This was code-efficient but storage heavy, because the same data was stored in multiple files. After the project was completed, I went back and built a sql database to store all the data in a more efficient and elegant way. This has two major advantages. First, I would not need to store multiple copies of the same data, and second, during the analysis I don't have to load all the data into memory.

To construct this database, I followed the same steps as above, with the exception that I did not re-scrape the data. Rather, I took the existing data that was already scraped and stored it in separate tables in my postgres server and included indices to make merging efficient for when loading the data into memory.

For the modeling part, I focused on the Bishop dataset. I used an ensemble of log-linear and Poisson regression on five features in order to predict the number of people who have a particular boulder problem on their To-do List. The five features I used are: 1. StarRatings (number of star votes), 2. Ticks (number of completions), 3. Average Stars, 4. Length, and 5. Grade. Note that StarRatings and Ticks are highly collinear, but removing one or the other reduces the model's accuracy.

For more information, please read my [blog post](https://harrisonized.github.io/2019/05/08/mountain-project-recommender.html) and feel free to [email me](mailto:harrisonized@gmail.com) with any questions.