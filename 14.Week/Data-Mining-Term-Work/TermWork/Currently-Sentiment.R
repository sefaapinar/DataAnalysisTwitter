library(twitteR)        #Twiiter'dan veri almak için kullanırız.
library(graphics)       #Grafik fonksiyonlarını görmek için kullanılır.
library(purrr)		#Fonksiyon oluşturma işlemlerinde kullanılır.
library(stringr)        # 'string' verilere yani metinsel verilere manipülasyon için kullanırız.
library(tm)             #Metin analizi için kullanırız.
library(syuzhet)   	#Metinlerden duygu ve duyguya dayalı kelimelerin çıkarılması için bir pakettir.


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





#Veri Temizleme:


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

# Kıvırcık işaretler, üç nokta, amerikan standart kodlarını ve işleyişlerini kaldırma.
#  Bu işlemleri için textclean paketi kullanılır. "textclean"  

install.packages("textclean")

removeNonAscii<-function(x) textclean::replace_non_ascii(x) 
twitterCorpus<-tm_map(twitterCorpus,content_transformer(removeNonAscii))

twitterCorpus<- tm_map(twitterCorpus,removeWords,c("amp","ufef",
                                                   "ufeft","uufefuufefuufef","uufef","s","rt","ufuf"))  

twitterCorpus<- tm_map(twitterCorpus,stripWhitespace)

inspect(twitterCorpus[1:10])

# Metin analizimizden ve temiz metilerimizi hazır hale getirdikten sonra 
# duygu analizi için işlemlerimizi gerçekleştirelim.

#Duygu Analizi:
  

# 8 duygusal duygu sayısını bulmak
emotions<-get_nrc_sentiment(twitterCorpus$content)
barplot(colSums(emotions),cex.names = .8,
        col = rainbow(10),
        main = "Sentiment scores for tweets"
)









