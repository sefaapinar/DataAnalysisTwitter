library(twitteR)
library(graphics)
library(purrr)
library(stringr) 
library(tm)
library(syuzhet)


#API Bağlantısı:

api_key<- "d2eYYpBYUIjBgvz0ZY7txeyrX"
api_secret <- "wULbJcMz3w6gp0QoY4wjjKjs2S7mV7WEvVevZBUKnnwm4DLtvQ"
access_token <- "1296063762-cnWaKsX8FxcJ8mcx1v4HuBzSWjBQyuZB81XsZd7"
access_token_secret <- "65M2925suBJxGu8FC7IyfkimwU78UUhR9xwU73yyGwLMg"
setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)



#Tweet Çekim İşlemi:

bill_tweets <- searchTwitteR("#BillGates", n = 20000)


tweets.df <- twListToDF(bill_tweets)  

write.csv(tweets.df, file="tweetsBill.csv", row.names=FALSE)  

#Verileri okuma işlemi 
Read in data:
  

setwd("C:/Users/Sefa/Documents/")
tweets.df<-read.csv("tweetsBill.csv")


#Clean up data:

twitterCorpus <-Corpus(VectorSource(tweets.df$text))
inspect(twitterCorpus[1:10])
twitterCorpus<- tm_map(twitterCorpus, content_transformer(tolower))
twitterCorpus<- tm_map(twitterCorpus,removeWords,stopwords("en"))
twitterCorpus<- tm_map( twitterCorpus,removeNumbers)
twitterCorpus<- tm_map( twitterCorpus,removePunctuation)

removeURL<- function(x) gsub("http[[:alnum:]]*", "", x)   
twitterCorpus<- tm_map(twitterCorpus,content_transformer(removeURL))

removeURL<- function(x) gsub("edua[[:alnum:]]*", "", x)   
twitterCorpus<- tm_map(twitterCorpus,content_transformer(removeURL))

# remove non "American standard code for information interchange (curly quotes and ellipsis)"
#  using function from package "textclean"  
install.packages("textclean")

removeNonAscii<-function(x) textclean::replace_non_ascii(x) 
twitterCorpus<-tm_map(twitterCorpus,content_transformer(removeNonAscii))

twitterCorpus<- tm_map(twitterCorpus,removeWords,c("amp","ufef",
                                                   "ufeft","uufefuufefuufef","uufef","s","rt","ufuf"))  

twitterCorpus<- tm_map(twitterCorpus,stripWhitespace)

inspect(twitterCorpus[1:10])

# stem corpus after sentiment analysis(given my sentiment dictionary choice), but before cluster analysis

#Sentiment analysis:
  

# 8 duygusal duygu sayısını bulmak
emotions<-get_nrc_sentiment(twitterCorpus$content)
barplot(colSums(emotions),cex.names = .8,
        col = rainbow(10),
        main = "Sentiment scores for tweets"
)



#Hocam burada 


# duygusal pozitif derecelendirme işlemi
get_sentiment(twitterCorpus$content[1:10])
sent<-get_sentiment(twitterCorpus$content)
sentimentTweets<-dplyr::bind_cols(tweets.df,data.frame(sent))
# mean of sentiment positivity

meanSent<-function(i,n){
  mean(sentimentTweets$sent[i:n])
}

(scores<-c(prat=meanSent(1,250),
          ))








#Cluster analysis:
  
  
# convert to stem words
twitterCorpus<-tm_map(twitterCorpus,stemDocument)
# build document term matrix
dtm<-DocumentTermMatrix(twitterCorpus)
dtm
mat<-as.matrix(dtm)
# create distance matrix
d<-dist(mat)
# input distance matrix into hclust function using method "ward.D"
groups<-hclust(d,method="ward.D")
plot(groups,hang=-1)
cut<-cutree(groups,k=6)
newMat<-dplyr::bind_cols(tweets,data.frame(cut))
table(newMat$screenName,newMat$cut)
