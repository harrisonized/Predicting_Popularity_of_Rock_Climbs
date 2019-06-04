# Predicting Popularity of Rock Climbs

For this project, I analyzed data from [Mountain Project](https://www.mountainproject.com). First, I scraped data for boulder problems in the Bishop and Joshua Tree areas. Then, I used a regression model on five features in order to predict the number of people who have a particular boulder problem on their To-Do List. The five features I used are: 1. StarRatings (number of star votes), 2. Ticks (number of completions), 3. Average Stars, 4. Length, and 5. Grade. Note that StarRatings and Ticks are highly collinear, but removing one or the other significantly reduces the model's accuracy.

This project is split roughly into three parts:

1. Data Acquisition
2. Exploratory Data Analysis
3. Modeling

For the Data Acquisition, I obtained data on Bishop and Joshua Tree. However, for the modeling, I chose to focus on the Bishop dataset.

For more information, please read [my blog post](https://harrisonized.github.io/2019/06/03/Project-2.html).