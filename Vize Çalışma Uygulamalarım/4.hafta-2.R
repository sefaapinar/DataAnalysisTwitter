#4.Vize Calismalari - 2

#Min maks normalizasyon ve zscore normalizasyon yapıldı.


#ilk oncelikle "r" paketimizi indirelim.

install.packages("rpart")
library(rpart)

#Veri tiplerinden başlaylaım.

#is.numeric - numerik deger.
#is.character - karakter deger.
#is.vector - vector
#is.data.frame - listeleme
#factor kategorik
#view() fonksiyonu nesnelerin ayrı bir pencerede görüntülenmesini sağlar.


#min maks normalizasyonu hazırlamak.

#ilk once vector olusturalim

sayilar <-c(10,23,65,78,54,33,25,9,2)

#vektoru cagiralim

sayilar

#olusturdugumuz vektorden min - maks degerlerini alalim

min(sayilar)

max(sayilar)

# Normalizasyon islemleri yapalim.

minmaksnormalize <-(sayilar-min(sayilar))/(max(sayilar)-min(sayilar))
print(minmaknormalize)


#orijinal data setimizle olusturdumuz minmaksı getirelim.

data.frame(minmaknormalize,sayilar)

# ZSCORE ORTALAMA Degerlerine bakalim

# zscore normalize yontemi icin ilk once ortalama ve standart sapmayı bulmamiz gerek.


#ortalama
mean(sayilar)

#standart sapma
sd(sayilar)


zscorenormalize <-(sayilar-mean(sayilar))/sd(sayilar)
print(zscorenormalize)


# normalize hali ve orijinal halini karsilastiralim.


data.frame(zscorenormalize,sayilar)










































