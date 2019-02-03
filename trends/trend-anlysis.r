# Simple analyses of trends.
library(tidyverse)
library(lubridate)
library(gridExtra)

# Function to read trend files.
read_trends <- function(filename) {
  # Read .zip or .csv?
  if (endsWith(tolower(filename), ".zip")) {
    df <- read.csv(unz(filename, sub(".zip", "", filename)), 
                   sep=",", encoding="UTF-8")
  } else {
    df <- read.csv(filename, 
                   sep=",", encoding="UTF-8")
  }
  # Old or new format? Old format has 2 headers.
  # Add missing headers to match new format.
  if (ncol(df) == 2) {
    df$tweetvolume <- NA
    df$promotedcontent <- NA
  }
  # Set as date.
  df$datetime <- lubridate::ymd_hm(df$datetime)
  return(df)
}

# Read trends from files.
df1 <- read_trends("2014-12-18_to_2016-03-29_trends_sweden.csv.zip")
df2 <- read_trends("2016-03-29_to_2018-07-20_trends_sweden.csv.zip")
df3 <- read_trends("trends_sweden.csv.zip")

#df1 <- read_trends("2014-12-18_to_2016-03-29_trends_sthlm.csv.zip")
#df2 <- read_trends("2016-03-29_to_2018-07-20_trends_sthlm.csv.zip")
#df3 <- read_trends("trends_sthlm.csv.zip")

#df1 <- read_trends("2014-12-19_to_2016-03-29_trends_gbg.csv.zip")
#df2 <- read_trends("2016-03-29_to_2018-07-20_trends_gbg.csv.zip")
#df3 <- read_trends("trends_gbg.csv.zip")

# Combine all rows into a single data frame.
trends <- rbind(df1, df2, df3)

# Delete temporary data frames.
rm(df1, df2, df3)

# How many trends do we have?
nrow(trends)

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

# Plot number of times a specific trend has trended by month.
trends %>% 
  mutate(year_month = lubridate::floor_date(datetime, unit="month"),
         week = lubridate::week(datetime),
         year = lubridate::year(datetime)) %>% 
  group_by(trend, year_month) %>% 
  count(sort=TRUE) %>% 
  ungroup() %>% 
  filter(trend %in% c("#svpol", "#svmed", "#lyrikfredag", "#ifkgbg")) %>%
  ggplot(aes(year_month, n, fill=n)) +
    geom_col() +
    theme_bw() +
    theme(legend.position = "none") +
    labs(title = "Antal gånger som trend har trendat per månad i Sverige 2014 till 2019",
         caption = paste0("Baserat på ", nrow(trends), " trender"),
         x = NULL,
         y = NULL) +
    facet_wrap(~ trend, ncol=2)

# Plot relative number of times a specific trend has trended by month.
trends %>% 
  mutate(year_month = lubridate::floor_date(datetime, unit="month"),
         week = lubridate::week(datetime),
         year = lubridate::year(datetime)) %>% 
  group_by(year_month, trend) %>% 
  summarize(n = n()) %>%
  mutate(percent = n / sum(n) * 100) %>%
  ungroup() %>% 
  filter(trend %in% c("#svpol", "#svmed", "#lyrikfredag", "#ifkgbg")) %>%
  ggplot(aes(year_month, percent, fill=n)) +
    geom_col() +
    theme_bw() +
    theme(legend.position = "none") +
    labs(title = "Relativ frekvens av trend per månad i Sverige 2014 till 2019",
         subtitle = "Relativt till alla trender per månad",
         caption = paste0("Baserat på ", nrow(trends), " trender"),
         x = NULL,
         y = "Procent") +
    facet_wrap(~ trend)
