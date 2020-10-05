# Predicting Popularity of Rock Climbs

For this project, I used regression techniques on data from [Mountain Project](https://www.mountainproject.com) to predict the number of users who would have a particular rock climb on their to-do-list.

First, I acquired and cleaned the data according to the following steps.

1. Download data for boulder problems in the Bishop and Joshua Tree areas (available in csv format).
2. Clean the data by standardizing column names and deriving new columns from the old ones (eg. getting the url_id from the url)
3. Scrape the data for the missing features (star_ratings, suggested_ratings, on_to_do_lists, ticks)
4. Create log and sqrt transformations of the features and target

When I did the project the first time, I used Pandas exclusively and exported the data after each step in separate CSV files. After the project was completed, I went back and built a postgres database to store all the data in a more scalable way.  This forced me to think about design choices and better mimics getting data in an industry setting.

The order of operations for the notebooks is as follows:

1. zip.ipynb - use this to unzip the files in data/downloads
2. clean-data-from-mp.ipynb
3. get-ratings-from-mp.ipynb
4. transform-features.ipynb
5. Use `psql -f "mountain-project-recommender/sql/create-db.sql"` to copy the data exported above into your local postgres server
6. plot-features-vs-target.ipynb
7. train-ridge-and-lasso.ipynb
8. train-log_linear-and-poisson.ipynb
9. ensemble-log_linear-and-poisson.ipynb

Optional files:

1. move-data-to-postgres.ipynb
2. all files in the practice directory

For the modeling part, I focused on the Bishop dataset. I used an ensemble of log-linear and Poisson regression on five features in order to predict the number of people who have a particular boulder problem on their To-do List. The five features I used are: 1. StarRatings (number of star votes), 2. Ticks (number of completions), 3. Average Stars, 4. Length, and 5. Grade. Note that StarRatings and Ticks are highly collinear, but removing one or the other reduces the model's accuracy.

For more information, please read my [blog post](https://harrisonized.github.io/2019/05/08/mountain-project-recommender.html) and feel free to [email me](mailto:harrisonized@gmail.com) with any questions.