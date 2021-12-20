# İLK ÖNCELİKE VERİ ANALİZİ YAPMAMIZ İÇİN İNDİRMEMİZ GEREKEN PAKETLERİ İNDİRİP VE TANIYALIM.

install.packages("ROAuth")        #Twitter'daki uygulamaya giriş yapmak ve iletişim kurmak için kullanırız.
install.packages("twitteR")       #Twiiter'dan veri almak için kullanırız.
install.packages("tm")            #Metin analizi için kullanırız.
install.packages("wordcloud")     #Kelime bulutu hazırlamak için kullanırız.
install.packages("ggplot2")       #Oluşturacağımız grafikleri görüntülemek için kullanırız.
install.packages("RColorBrewed")  #Oluşturulacak renk paletleri için kullanırız.
install.packages("stringr")       # 'string' verilere yani metinsel verilere manipülasyon için kullanırız.
install.packages("dplyr")         #Ortak sorun kümeleri için (split-apply-combine işlemleri için kullanırız.)
install.packages("tidytext")      #Düzenli metin araçlarını barındırır.
install.packages("readr")         #csv ya da tsv gibi dikdörtgen şeklindeki veri tablolarının okunması için kullanılır.


# YÜKLEDİĞİMİZ KÜTÜPHANELERİ AKTİFLEŞTİRELİM.

library(ROAuth)
library(twitteR)
library(tm)
library(wordcloud)
library(ggplot2)
library(Rcolor)
library(stringr)
library(dplyr)
library(tidytext)
library(readr)
library(stringi)

# "ROAuth" paketindeki setup_twitter_oauth() fonksiyonu kullanılarak twitter
# API hesabımızla iletişimi sağlıyoruz.
# ilk öncelikle API'Lerimizi giriyoruz.

api_key <- "Xc1vCu38rnuw0VLIQHBcwW3Un"
api_secret_key <- "nulYtv5BV6lV6029mw6hW2oZnlovbYVh9T31jA6DihrCg3Avxg"
access_token <- "1296063762-3GTVM9yxrOgqV1Z1u6VvRyWUW8GonsLJLH61yZO"
access_token_secret <- "1A9FJwDWdlDootY7G5KYzJxxEWutSuYh4wq1A8zUA7ojy"

setup_twitter_oauth(api_key,api_secret_key,access_token,access_token_secret)


# Twitter da, "twitteR" paketindeki searchTwitter() fonksiyonu ile
# Türkiye Galatasaray Spor Kulupunun hesabından 1000 tane veri toplandı.

gsData <- searchTwitteR('#galatasaray', n = 1000, lang = "tr")  # '#galatasary' adı altındaki verileri çekiyoruz.
gsData.df <- twListToDF(gsData) #veri dataFrame ortamında listeleyerek görüntüleriz.
length(gsData) #Length methodu kaç tane çektiğimizi gösterir.

# gsData - tweet_clean dönüştürdük.
tw_clean <- twListToDF(gsData)


tw_clean$text <- stri_enc_toutf8(tw_clean$text)
# Tweetlerde oluşan RT ifadelerini kaldırıyoruz.
tw_clean$text <- ifelse(str_sub(tw_clean$text,1,2) == "RT",
substring(tw_clean$text,3),
tw_clean$text)

gsData.text <- sapply(gsData,function(x) x$getText())
myccorpus <- Corpus(VectorSource(gsData.text))


library(readxl)
Turkish_Stopwords <- read_excel("C:/Users/Sefa/Documents/Turkish-Stopwords.xlsx")
head(Turkish_Stopwords) #En çok kullanılan kelimeler.
Turkish_Stopwords

removeURL <- function(x) gsub("http[[:alnum:]]*","",x)
removePunct <- function(x) gsub("[^[:alpha:][:space:]]*","",x)
tw_clean <- tm_map(myccorpus,PlainTextDocument)
tw_clean <- tm_map(tw_clean, content_transformer(removeURL))
tw_clean <- tm_map(tw_clean, stripWhitespace())
tw_clean <- tm_map(tw_clean, content_transformer(toupper))
tw_clean <- tm_map(tw_clean, removeWords, Turkish_Stopwords)
tw_clean <- tm_map(tw_clean, content_transformer(removePunct))
tw_clean <- tm_map(tw_clean,removePunctuation)

gsData_tdm <- TermDocumentMatrix(tw_clean)
gsData_tdm
 
gsData_m <- as.matrix(gsData_tdm)
dim(gsData_m)



gs_freq <- rowSums(gsData_m)
gs_freq <- sort(gs_freq, decreasing = TRUE)

gs_freq[1:100]



barplot(gs_freq[1:100], col ="tan",las=2)


wordcloud(myccorpus,min.freq = 2,scale = c(2,1),colors = brewer.pal(8,"Dark2"),
          random.color = TRUE, random.order = FALSE, max.words = 200)







































































##################İLK YAPTIĞIM##########
# Metin Temizleme İşlemlerimiz.

#karakter tip donusturmesi
tw_clean$text <- as.character(tw_clean$text)

#URL linklerini temizliyoruz.
tw_clean$text <- str_replace_all(tw_clean, "http[^[:space:]]*", "")

#Noktalama işaretlerini kaldırıyoruz.
tw_clean$text <- str_replace_all(tw_clean$text, "[[:punct:][:blank:]]+", " ")

# "#" Hashtag işaretlerini kaldıyoruz.
tw_clean$text <- str_replace_all(tw_clean$text, "#\\S+", "")

# "@" İşaretini kaldırıyoruz.
tw_clean$text <- str_replace_all(tw_clean$text, "@\\S+", "")

#Tüm harfleri büyük harfa dönüştürüyoruz.
tw_clean$text  <- str_to_upper(tw_clean$text, "tr")

# [0-9] arasındaki rakamları kaldırıyoruz.
tw_clean$text <- removeNumbers(tw_clean$text)

#ASCII Formatına uymayan karakterleri temizliyoruz.
tw_clean$text <- str_replace_all(tw_clean$text, "[<].*[>]", "")
tw_clean$text <- gsub("\uFFFD", "", tw_clean$text, fixed =  TRUE)
tw_clean$text <- gsub("\n", "", tw_clean$text, fixed =  TRUE)

#Alpha yani alfabetik olmayan harfleri kaldırıyoruz.
tw_clean$text <- str_replace_all(tw_clean$text, "[^[:alnum:]]"," " )

#http degerlerini kaldırıyoruz.
tw_clean$text <- gsub("http\\w+", "", tw_clean$text)

#
tw_clean <- tm_map(tw_clean, removePunctuation)



library(readxl)
Turkish_Stopwords <- read_excel("C:/Users/Sefa/Documents/Turkish-Stopwords.xlsx")
head(Turkish_Stopwords) #En çok kullanılan kelimeler.


# Metini Belirteçlere bölerek hangi kelimenin kaçar tane tekrar ettiğini gördük.
tokens <- data_frame(text = tw_clean$text) %>%
  unnest_tokens(word, text) %>%
  anti_join(stop_words) %>%
  count(word, sort = TRUE)
# output to csv for further usage
write.csv(tokens, './galatasaray.csv',row.names = FALSE) #Belgelerim adlı dosyamıza galatasaray.csv,
#uzantılı bir dosya ekliyoruz.





tidy_tweets <- tw_clean %>% select(text) %>% 
  mutate(linenumber = row_number()) %>% unnest_tokens(word, text)

tidy_tweets <- tidy_tweets %>% anti_join(Turkish_Stopwords, by=c("word"="STOPWORD"))

head(tidy_tweets)


tidy_tweets %>%
  count(word, sort = TRUE) %>%
  filter(n > 30) %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(word, n)) +
  geom_col() +
  xlab(NULL) +
  coord_flip() + theme_minimal() +
  ggtitle("Tweetlerde en çok kullanılan kelimeler")

tidy_tweets %>% 
  count(word) %>%
  colors(brewer.pal(8,"Dark2"),
         random.color=TRUE)
  with(wordcloud(word, n, max.words = 5))



gsData_tdm <- TermDocumentMatrix(text,control = list(removePunctuation=TRUE,stop_words=TRUE))
gsData_tdm

gs_mtx <- as.matrix(gs_tdm)
dim(gs_mtx)




gsData.txt <- sapply(gsData, function(x) x$getText())
myycorpus <-Corpus(VectorSource(gsData.txt))

tw_clean <- tm_map(myycorpus, PlainTextDocument)


new_stop <- c(stop_words,"ts","bjk","terim","tr","tr")
new_stop

wordcloud(myccorpus,min.freq = 2,scale = c(2,0.5),colors = brewer.pal(8,"Dark2"),
          random.color = TRUE, random.order = FALSE, max.words = 200)







































































