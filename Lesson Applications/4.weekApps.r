#4.Hafta Derste yapılan Uygulamalar.


#veri tipleri
#is.numeric - numeric
#is.character - karekter
#is.vector
#is.matrix
#is.data.frame
#factor kategorik
# data. frame eşit uzunluktaki vektörlerden oluşan listeler 
#view() fonksiyonu nesnelerin ayrı bir pencerede görüntülenmesini sağlar.


#Min-Maks Normalizasyonu


#vektor olusturma

x <- c(25,41,47,85,1,23,17,6,29,34,100)

#oluşturduğumuz vektörü çağırma

x

#vektörden min değerini çağırma

min(x)

#vektörden maks değerini çağırma

max(x)

#min maks normalizasyon değerini bulma

minmaksnormalize <- (x-min(x))/(max(x)-min(x))
print(minmaksnormalize)

# orijinal veri seti ile normalize veri setini kiyasalama

data.frame(veri=x, normalize=minmaksnormalize)

#Zscore normalizasyon

#ortalama ve standart sapma alımı

#ortalama  mean(x) ile alınır.

mean(x)

#standartsapma almak için sd(x) ifadesi kullanılır

sd(x)

#zscore normalizasyon işlemi

zscore <- (x-mean(x))/sd(x)
print(zscore)

#orijinal veri seti ile zscore normalize veri setini kıyasalama

data.frame(veri=x, normalizezscore = zscore)
