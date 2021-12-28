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

api_key <- "ceLimfU4B1iO2Akx6inLMJAA2"
api_secret_key <- "nICLZFxwQ3ygEK580zDZ9b8fUO5xSi4NCtCHDXl1GE9vRTXquK"
access_token <- "1296063762-9UM8ZjPCoq0APOSmQ7Svutla5IPP8KHQ8Nqyndy"
access_token_secret <- "fl0uRuRROKpFnZq3DWbx43MSVgpqQj4inf0DkQETLcg6w"

setup_twitter_oauth(api_key,api_secret_key,access_token,access_token_secret)


# Twitter da, "twitteR" paketindeki searchTwitter() fonksiyonu ile
# "BillGates" hesabının 21 günlük verileri çekilmiştir ve incelemeleri yapılmıştır.

BillData <- searchTwitteR('#BillGates', n = 30000, lang="en")  # '#BillGates' adı altındaki verileri çekiyoruz.


#Length methodu kaç tane çektiğimizi gösterir.

save(BillData, file="BillData.RData") #Data Kaydedilir.
length(BillData)

head(BillData)

#Corpus Oluşturma İşlemi

BillData.text <- sapply(BillData, function(x) x$getText())
mycorpus <- Corpus(VectorSource(BillData.text))


#Temizleme İşlemleri


removeURL <- function(x) gsub("http[[:alnum:]]*","",x)
removeNumPuncts <- function(x) gsub("[^[:alpha:][:space:]]*","",x)

#Gereksiz yere tekrar eden verileri kaldırmak için kullanığımız 
#kelimeleri ekliyoruz.

rmv_word <- c(stopwords("en"))

#Listeledik.
rmv_word


clean_corp <- tm_map(mycorpus, PlainTextDocument)
clean_corp <- tm_map(clean_corp, content_transformer(removeURL))
clean_corp <- tm_map(clean_corp, stripWhitespace)
clean_corp <- tm_map(clean_corp, content_transformer(tolower))
clean_corp <- tm_map(clean_corp, removeWords, rmv_word)
clean_corp <- tm_map(clean_corp, content_transformer(removeNumPuncts))
clean_corp <- tm_map(clean_corp, removePunctuation)

BillData.text[10] #Verinin temizlenmemiş hali.



clean_corp[[10]][1] #Verinin temizlenmiş hali.


#Terim Dökümantasyon Değerleri
BillData_tdm <- TermDocumentMatrix(clean_corp)
BillData_tdm


#matrix oluşturma
BillData_m <- as.matrix(BillData_tdm)
dim(BillData_m)


#Frequency Kullanılan kelimelerin sayılarının azalan sıraya göre sıralamak.
term_freq <- rowSums(BillData_m)
term_freq <- sort(term_freq, decreasing = TRUE)

term_freq[1:10] #10 tane veriyi getirdik.


#Grafik halinde görelim
barplot(term_freq[1:10], col="tan", las=2)


#Frekansı 500 ve daha üzeri olan kelimelerin grafiği
term_freq <- subset(term_freq, term_freq >=500)
term_freqs_df <- data.frame(term= names(term_freq), freq= term_freq)
ggplot(term_freqs_df, aes(x=term, y=freq)) + 
            geom_line(aes(group=1), colour="salmon3")+
            geom_point(size=3, colour="pink2") + xlab("kelime") + ylab("Frekans") + coord_flip()


#Kelime Bulutu Oluşturma

wordcloud(clean_corp, min.freq = 2, scale =c(2,0.5),colors = brewer.pal(8,"Dark2"),
          random.color = TRUE, random.order = FALSE, max.words = 200)


#Frekansa göre kelime bulutu oluşturma
word_freqs <- data.frame(term_freq, term = names(term_freq), num= term_freq)
wordcloud(word_freqs$term, word_freqs$num, max.words = 200, colors=brewer.pal(11,"RdYlGn"),random.color = TRUE)


#İlişkilendirmeler

#BillGates'i covid salgınıyla ilgili ilişkilendirdik.
#Korelasyon limiti en az %50 olanları getirdik.
#Ve ilişkili kelimeler, "exercise","performed","prior" gibi kelimeler gelmiştir.


findAssocs(BillData_tdm, terms="covid",corlimit = 0.5)

































































