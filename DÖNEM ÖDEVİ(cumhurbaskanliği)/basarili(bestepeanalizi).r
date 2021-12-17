install.packages("twitteR")
install.packages("xlsx")
library(xlsx)
library(twitteR)

api_key <- "YEc9wVmQbj3B4JoFtWv0PUZlo"
api_secret_key <- "RtvtKq8jZ6Lr5dbn04zxYJbEdmfaS26oZ25NYb1fk0fgttTU3f"
acces_token <- "1296063762-etPyUYbRt8EzDmykGq7gom648IGoem9Q8w2Ct5x"
access_token_secret <- "eFohoVhac9V3YCQwVhuN9SuZLu37Ej9CcVchmxUGxqwde"

setup_twitter_oauth(api_key,api_secret_key,acces_token,access_token_secret)

sefaapinar <-searchTwitter("#bebek", n=100, lang = "tr")

sefa <- twListToDF(sefaapinar)

head(sefa$text)

write.xlsx(sefa, "c:/datanalysis/30.11.21analysis.xlsx")

library(tm)
library(readr)






