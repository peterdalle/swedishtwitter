# Simple analyses of trends.

library(tidyverse)

# Read CSV file with 2 headers: datetime,trend
df1 <- read.csv("2014-12-19_to_2016-03-29_trends_sweden.csv",
                header=TRUE, sep=",", encoding="UTF-8")

# Read CSV file with 4 headers: datetime,trend,tweetvolume,promotedcontent
df2 <- read.csv("2016-03-29_to_2018-07-20_trends_sweden.csv",
                header=TRUE, sep=",", encoding="UTF-8")

df3 <- read.csv("trends_sweden.csv", 
                header=TRUE, sep=",", encoding="UTF-8")

# Add missing headers to CSV data with 2 headers.
df1$tweetvolume <- NA
df1$promotedcontent <- NA

# Combine all rows into a single data frame.
trends <- rbind(df1, df2, df3)

# Delete temporary data frames.
rm(df1, df2, df3)

# How many trends do we have?
nrow(trends)

# Set data type: date (This is slow. Use lubridate if too slow.)
#trends$datetime <- as.Date(trends$datetime)

# Plot most trended.
trends %>% 
  group_by(trend) %>% 
  count(sort=TRUE) %>% 
  head(25) %>%
  ggplot(aes(reorder(trend, n), n, fill=n)) +
    geom_col() +
    coord_flip() +
    theme_minimal() +
    theme(legend.position = "none") +
    labs(title = "Mest trendade hashtaggarna i Sverige 2014 till 2019",
         caption = paste0("Baserat på ", nrow(trends), " trender"),
         x = NULL)