# Swedish Twitter - Trends

Over 5 million trends (e.g., hashtags) in total from 2014 and onwards from three locations have been collected every hour via the [Twitter GET trends/place API](https://dev.twitter.com/rest/reference/get/trends/place):

* Sweden (WOEID 23424954)
* Stockholm (WOEID 906057)
* Gothenburg (WOEID 890869)

## CSV headers

Header | Description
:---------- | :--------------------------
`datetime` | when the trend was collected in format `yyyy-mm-dd hh:mm`.
`trend` | name of the trend (e.g., hashtag).
`tweetvolume` | number of tweets the last 24 hours for the trend, as reported by Twitter.
`promotedcontent` | whether the trend is promoted content, as reported by Twitter.

## Files

Twitter trends collected from 2014-12-18 and onwards:

Location | File | Collection | n | Headers
:------------- | :------------- | :------------- | -------: | ----------:
Sweden | [2014-12-18_to_2016-03-29_trends_sweden.csv.zip](2014-12-18_to_2016-03-29_trends_sweden.csv.zip) | Every 8 hours | 25,768 | 2
Sweden | [2016-03-29_to_2018-07-20_trends_sweden.csv.zip](2016-03-29_to_2018-07-20_trends_sweden.csv.zip) | Every 1 hour | 822,280 | 4
Sweden | [trends_sweden.csv.zip](trends_sweden.csv.zip) | Every 1 hour* | 979,376 | 4
Stockholm | [2014-12-18_to_2016-03-29_trends_sthlm.csv.zip](2014-12-18_to_2016-03-29_trends_sthlm.csv.zip) | Every 8 hours | 25,786 | 2
Stockholm | [2016-03-29_to_2018-07-20_trends_sthlm.csv.zip](2016-03-29_to_2018-07-20_trends_sthlm.csv.zip) | Every 1 hour | 823,658 | 4
Stockholm | [trends_sthlm.csv.zip](trends_sthlm.csv.zip) | Every 1 hour* | 979,775 | 4
Gothenburg | [2014-12-19_to_2016-03-29_trends_gbg.csv.zip](2014-12-19_to_2016-03-29_trends_gbg.csv.zip) | Every 8 hours | 25,791 | 2
Gothenburg | [2016-03-29_to_2018-07-20_trends_gbg.csv.zip](2016-03-29_to_2018-07-20_trends_gbg.csv.zip) | Every 1 hour | 829,743 | 4
Gothenburg | [trends_gbg.csv.zip](trends_gbg.csv.zip) | Every 1 hour* | 979,736 | 4

\* Collected from 2018-11-21 and onwards (data is missing 2018-07-20 to 2018-11-21 due to a server crash).

## File preview

```bash
$ head 2016-03-29_to_2018-07-20_trends_gbg.csv

datetime,trend,tweetvolume,promotedcontent
2016-03-29 11:24,Avicii,,
2016-03-29 11:24,Cypern,,
2016-03-29 11:24,#EgyptAir,122209,
2016-03-29 11:24,#svmed,,
2016-03-29 11:24,Larnaca,33662,
2016-03-29 11:24,#KEIOSFESTIVAL16,,
2016-03-29 11:24,Tjeckien,,
2016-03-29 11:24,Lahore,175765,
2016-03-29 11:24,#tv4nyheterna,,
```

## R code to load trends

This will load trends from the location Sweden.

```r
# Read CSV file with 2 headers: datetime,trend
df1 <- read.csv("2014-12-18_to_2016-03-29_trends_sweden.csv.zip",
                header=TRUE, sep=",", encoding="UTF-8")

# Read CSV file with 4 headers: datetime,trend,tweetvolume,promotedcontent
df2 <- read.csv("2016-03-29_to_2018-07-20_trends_sweden.csv.zip",
                header=TRUE, sep=",", encoding="UTF-8")
df3 <- read.csv("trends_sweden.csv.zip", header=TRUE, sep=",", encoding="UTF-8")

# Add missing headers to old format.
df1$tweetvolume <- NA
df1$promotedcontent <- NA

# Combine all rows into a single data frame.
trends <- rbind(df1, df2, df3)

# Delete temporary data frames.
rm(df1, df2, df3)

# How many trends do we have?
nrow(trends)
```

## How are trends determined?

According to [Twitter FAQ](https://help.twitter.com/en/using-twitter/twitter-trending-faqs):

> Trends are determined by an algorithm and, by default, are tailored for you based on who you follow, your interests, and your location. This algorithm identifies topics that are popular now, rather than topics that have been popular for a while or on a daily basis, to help you discover the hottest emerging topics of discussion on Twitter.
>
> You can choose to see trends that are not tailored for you by selecting a specific trends location on twitter.com, iOS, or Android (instructions below). Location trends identify popular topics among people in a specific geographic location.
> 
> Note: The number of Tweets that are related to the trends is just one of the factors the algorithm looks at when ranking and determining trends. Algorithmically, trends and hashtags are grouped together if they are related to the same topic. For instance, #MondayMotivation and #MotivationMonday may both be represented by #MondayMotivation.

## Cite

If you use the Twitter trends data, please cite using the following BibTeX:

```BibTeX
@misc{twitter_trends_2017,
    title = {Swedish Twitter Trends},
    url = {https://snd.gu.se/en/catalogue/study/ext0271},
    abstract = {Twitter trends from Swedish Twitter (Sweden, Stockholm, Göteborg). Trends collected every hour from 2016-03-29 and onwards via the GET trends/place API. Data contains datetime, name of the trend, tweet volume, and whether or not the trend is promoted content.},
    publisher = {Swedish National Data Service},
    author = {Dahlgren, Peter M.},
    year = {2017},
    keywords = {Twitter, Trends}
}
```