# Swedish Twitter

Here I will gather some data collections from the Swedish Twitter.

## Trends from Swedish Twitter 2016 and onwards

About [one million hashtags](trends/) from Sweden, Stockholm and Gothenburg.

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

## See also

- [Swedish Facebook](https://github.com/peterdalle/swedishfacebook)
