#4.HAFTA R PROGRAMLAMA KURULUMU - YAPILDI.
#MİN-MAKS NORMALİZASYON VE ZSCORE NORMALİZASYON İŞLEMLERİ YAPILDI.

#Paket Kurma
install.packages("rpart")

#veri tipler
#is.numeric
#is.vector
#is.matrix
#is.dataframe
#is.character
#is.factor kategorik
#data. frame eşit uzunluktaki vektörlerden oluşan listeler
#view() fonksiyonu nesnelerin ayrı bir pencerede görüntülenmesini sağlar.
 

min maks normalizasyonu


#Vector oluşturma
x <- c(25,16,44,22,47,52,34,32,10,5,99)

#vector cagirma
x

#vectorden min degerini cagirma
min(x)

#vectorden max degerini cagirma
max(x)

#min-maks normalizasyon
minmaksnormal <-(x-min(x))/(max(x)-min(x))
print(minmaksnormal)

#orijinal veri seti ile normalize veri setini kiyaslama
data.frame(veri=x , normalize= minmaksnormal)

#Zscore Normalizasyonu
#ortalama ve standart sapma

#ortalama
mean(x)
#standart sapma
sd(x)

#zscore normalizasyon
zscore <- (x-mean(x))/sd(x)
print(zscore)

#orjinal veri seti ile zcore normalize veri setini kıyasayalım
data.frame(veri=x, normalizezscore=zscore)
