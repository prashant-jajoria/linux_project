# 31187366 - Assignment 3

library("tidyverse")
library("ggplot2")

df = read_csv(file = "timeline_data.csv")
df$posted_at = strptime(df$posted_at, "%Y-%m-%d %H:%M:%S")

hist(df$posted_at,
     breaks = 12,
     xlab = "Year",
     ylab = "No of Articles",
     main = paste("Histogram of" , "Frequency of Articles containing Trump"))

df2 = read_csv("task_b3.csv",col_names = FALSE)

col_names = list("file_name","id",	"page_id",	"name"	,"message",	"description",	"caption",	"status_type",	"likes_count",
"comments_count",	"shares_count"	,"love_count",	"wow_count",	"haha_count",	"sad_count"	,"thankful_count",	
  "angry_count",	"link",	"picture",	"posted_at")

names(df2) = col_names
names(df2)

ggplot(df2, aes(shares_count, likes_count)) + 
  geom_point() + 
  ggtitle("Iris scatter plot - petals")+geom_smooth(method = "lm")

cor(df2$shares_count, df2$likes_count)

lmMod <- lm(likes_count~shares_count, data=df2) # build model
print(lmMod)

likesPred <- predict(lmMod, newdata = data.frame(shares_count=c(0,100,1000,10000,100000))) # predict

plot(c(0,100,1000,10000,100000),likesPred)

# write this line to R console to plot line of fit
abline(lm(likes_count~shares_count, data=df2))
