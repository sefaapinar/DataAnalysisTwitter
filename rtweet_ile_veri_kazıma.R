#Veri kazımada ihtiyacımız olacak paketlerin yüklenmesi
## 1. adım
install.packages("rtweet")
install.packages("httpuv")
install.packages("tidyverse")

## 2. adım
library(rtweet) #tweet verisini kazımak için
library(httpuv) #API'ye bağlanabilmek için
library(tidyverse) #Veriyi analiz edip görselleştirebilmek için
library(lubridate) #Tarih ve saat verisini düzenleyebilmek için

# R Studio üzerinden uygulama aracılığı ile API'ye erişim
#Eğer kendi analizinizi yapmak istiyorsanız, kendi oluşturduğunuz uygulamanın ismini ve 
#API değerlerini eklemelisiniz
appname <- "app_for_data_analysis1"
key <- "O7WFPLI8ZouZdlieDzzfBUcI3"
secret <- "c3bmQQ6dD1oSHDhwOtINqr3ieiewS48ubFYCZ68dRBET9DYeVG"
twitter_token <- create_token(app = appname, 
  consumer_key = key,consumer_secret = secret)

#trumpın son 1000 tweetini kazılayalım 
trump_tweets <- get_timeline("realdonaldtrump",n= 1000)

#veri setini düzenleyelim ve etkileşim değerini görselleştirelim
trump_tw <- rownames_to_column(trump_tweets) %>% 
  select(created_at,favorite_count,retweet_count)

trump_tw1 <- trump_tw %>% 
  mutate(etkilesim = (favorite_count+retweet_count)/2) %>%
  gather(etkilesim, deger, -created_at)

#düzenlediğimiz veriyi görselleştirelim
ggplot(trump_tw1, aes(created_at,deger, color = etkilesim)) + 
  geom_jitter(size = 4, alpha = 0.5) + 
  labs(x="",y="",title = "Trump'ın attığı son 1000 tweetin aldığı etkileşim değerleri") + 
  theme_minimal(base_size = 15, base_family = "Helvetica")+
  theme(legend.position = "bottom")
