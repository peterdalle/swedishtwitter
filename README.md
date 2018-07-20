# Swedish Twitter

Here I will gather some data collections from the Swedish Twitter.

## Trends from Swedish Twitter 2016 and onwards

* [trends/trends_sweden.7z](trends/trends_sweden.7z) (Sweden, WOEID 23424954)
* [trends/trends_sthlm.7z](trends/trends_sthlm.7z) (Stockholm, WOEID 906057)
* [trends/trends_gbg.7z](trends/trends_gbg.7z) (Gothenburg, WOEID 890869)

Twitter trends collected every hour from 2016-03-29 onwards (new data updated regularly). Each CSV file (which is compressed with [7-zip](https://www.7-zip.org)) currently contains about 740,000 trends, collected via the [Twitter GET trends/place API](https://dev.twitter.com/rest/reference/get/trends/place). 

CSV headers: 

- `datetime` is when the trend was collected in format yyyy-mm-dd hh:mm.
- `trend` is the name of the trend.
- `tweetvolume` is the number of tweets the last 24 hours for the trend, as reported by Twitter.
- `promotedcontent` is whether the trend is promoted content, as reported by Twitter.

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

### Citation

If you would like to use the Twitter trends data, please cite using the following BibTeX:

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

## Trends from Swedish Twitter 2014 to 2016

* [trends/2014-12-18_to_2016-03-29_trends_sweden.csv](trends/2014-12-18_to_2016-03-29_trends_sweden.csv) (Sweden, WOEID 23424954)
* [trends/2014-12-18_to_2016-03-29_trends_sthlm.csv](trends/2014-12-18_to_2016-03-29_trends_sthlm.csv) (Stockholm, WOEID 906057)
* [trends/2014-12-19_to_2016-03-29_trends_gbg.csv](trends/2014-12-19_to_2016-03-29_trends_gbg.csv) (Gothenburg, WOEID 890869)

Twitter trends from Stockholm, Göteborg and Sweden from 2014-12-18 to 2016-03-29. These trends were collected every **8 hours**. Each CSV file contains about 25,000 collected trends. Although there are no headers in the CSV file, the rows are simply `datetime, trend`.

## Members of Swedish Parliament (Riksdagen) Twitter Handles

[twitter/riksdagsledamoter-twitter.csv](twitter/riksdagsledamoter-twitter.csv) is a CSV file of MP's from Riksdagen with their Twitter handles. The CSV file has the header `Name, Party, Twittername`. The list contains 278 Twitter accounts from 349 MP's (80 %). The list is likely to be incomplete and may contain errors. (It's better to store the ID of each Twitter account – if they change username, for example.)

CSV headers: 

- `Name` is the name of the MP.
- `Party` is an abbreviation of the party name (M, C, L, KD, S, V, MP, SD).
- `Twittername` is the @name of the Twitter account.

## News media Twitter handles

[twitter/nyhetsmedier-twitter.csv](twitter/nyhetsmedier-twitter.csv) contains news media organizations Twitter handles.

CSV headers:

- `news` is an integer value whether the account post news (`1`) or not (`0`).
- `opinion` is an integer value whether the account post opinion pieces (`1`) or not (`0`).
- `name` is the full name of the account.
- `twittername` is the @name of the Twitter account.
- `twitterid` is the ID of the Twitter account.

## Facebook Pages

[facebook/sidor-facebook.csv](facebook/sidor-facebook.csv) contains Swedish Facebook pages, primarily news organizations and political parties.

CSV headers:

- `media` is an integer value whether the account is a media organization (`1`) or not (`0`).
- `politicalparty` is an integer value whether the account is a political party (`1`) or not (`0`).
- `politics` is an integer value whether the account is political in some way (`1`) or not (`0`).
- `pagename` is the full name of page.
- `pageid` is the ID of the page.
- `url` is the URL to the page on facebook.com.

The first three fields (media, politicalparty and politics) are not necessarily accurate at the moment.

Many of the pages are found via <https://gist.github.com/christopherkullenberg/07b38d18de8e747387c2d00915dba327> and then expanded with more details.
