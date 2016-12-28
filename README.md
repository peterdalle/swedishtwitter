# Swedish Twitter

Here I will gather some data collections from the Swedish Twitter.


## Trends from Swedish Twitter

* <code>trends_sweden.csv</code> (Sweden)
* <code>trends_sthlm.csv</code> (Stockholm)
* <code>trends_gbg.csv</code> (Gothenburg)

Twitter trends collected every hour from 2016-03-29 to 2016-12-27. Each CSV file contains about 280,000 trends, collected via the [GET trends/place](https://dev.twitter.com/rest/reference/get/trends/place) Twitter API. The CSV file headers is <code>datetime, trend, tweetvolume, promotedcontent</code>.

```bash
$ head trends_gbg.csv

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
Load the data into R from GitHub:

```r
trends_sweden <- read.csv("https://raw.githubusercontent.com/peterdalle/swedishtwitter/master/trends_sweden.csv", header=TRUE)

trends_sthlm <- read.csv("https://raw.githubusercontent.com/peterdalle/swedishtwitter/master/trends_sthlm.csv", header=TRUE)

trends_gbg <- read.csv("https://raw.githubusercontent.com/peterdalle/swedishtwitter/master/trends_gbg.csv", header=TRUE)
```
### Archived trends from Swedish Twitter

* <code>2014-12-18_to_2016-03-29_trends_sthlm.csv</code>
* <code>2014-12-18_to_2016-03-29_trends_sweden.csv</code>
* <code>2014-12-19_to_2016-03-29_trends_gbg.csv</code>

Twitter trends from Stockholm, Göteborg and Sweden from 2014-12-18 to 2016-03-29. All trends were collected every 8 hours. Each CSV file contains about 25,000 collected trends.

Although there are no headers in the CSV file, the headers is simply <code>datetime, trend</code>.

## Members of Swedish Parliament (Riksdagen) Twitter Handles

A CSV file of MP's from Riksdagen with their Twitter handles. The CSV file has the header <code>Name, Party, Twittername</code>.

The list contains 278 Twitter accounts from 349 MP's (80 %). The list is likely to be incomplete and may contain errors. (It's better to store the ID of each Twitter account – if they change username, for example.)

## Cite me

If you would like to cite this open data, please use the following BibTeX:

```BibTeX
@online{twitter_trends_2016,
	title = {Swedish Twitter Trends},
	url = {https://github.com/peterdalle/swedishtwitter},
	urldate = {2016-12-28},
	abstract = {Twitter trends from Swedish Twitter (Sweden, Stockholm, Göteborg). Trends collected every hour from 2016-03-29 to 2016-12-27 via the GET trends/place API. Data contains datetime, name of the trend, tweet volume, and whether or not the trend is promoted content.},
	journal = {GitHub},
	author = {Dahlgren, Peter M.},
	year = {2016},
	month = {dec},
	keywords = {Twitter, Trends}
}
```
