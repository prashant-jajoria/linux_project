# 31187366 - Assignment 3 - Task B3-2

# laod the required libraries
library("tidyverse")
library("ggplot2")

# read the csv file and ignore con_names
df2 = read_csv("news_data.csv",col_names = FALSE)

# make list of column names
col_names = list("file_name","id",	"page_id",	"name"	,"message",	"description",	"caption",	"status_type",	"likes_count",
                 "comments_count",	"shares_count"	,"love_count",	"wow_count",	"haha_count",	"sad_count"	,"thankful_count",	
                 "angry_count",	"link",	"picture",	"posted_at")

# add column names to the dataframe
names(df2) = col_names

# calculate the correlation
cor(df2$shares_count, df2$likes_count)

# make a scatter plot of shares v/s likes
ggplot(df2, aes(shares_count, likes_count)) + 
  geom_point() + 
  ggtitle("Scatter plot - Share count v/s Likes count")
