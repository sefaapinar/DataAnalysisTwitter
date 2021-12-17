

#karakter tiplerinde veri tipleri oluşturalım

esyalar <-c("Masa","Sandalye","Tahta","Silgi","Kalem","Telefon")

esyalar

#sisteme bir veri seti yükleyelim

degerler = read.table(file.choose(), header = T,sep =";")

#veri setindeki bulunan veri tiplerini görmek için
summary(degerler)

#veri setinde bulunan yas degiskeninin min ve maks degerlerini bulalım.

min(degerler$yas)

attach(degerler) #attach komutu fonksiyonları veri setlerine eklemek için kullanılır.

min(yas)
max(yas)



#yas için min maks normalizasyonununu hesaplayan programı yazınız.

yasnormalize <- (yas-min(yas))/(max(yas)-min(yas))
print(yasnormalize)

#boy için min max değerlerini bulalım

min(boy)
max(boy)

#boy için min maks normalizasyonunu bulalım

boynormalize <- (boy - min(boy)) / (max(boy)-min(boy))
print(boynormalize)


#kilo için min maks normalizasyonunu bulalım

min(kilo)
max(kilo)



#kilo normalizasyon


kilonormalize <- (kilo-min(kilo))/(max(kilo)-min(kilo))
print(kilonormalize)


# yaptığımız üç normalizasyonu bir arada görelim

data.frame(kilonormalize,boynormalize,yasnormalize)



#ZSCORE NORMALİZASYONU BULMA

detach(degerler)


mean(degerler$yas)

#veri setine entegre etmek için attach komutunu kullanalım

attach(degerler)
#ortalam alalim
mean(yas)

#standart sapma alalım

sd(yas)

#yas için zscore normalizasyonu alalım

zscoreyas <- (yas-mean(yas))/(sd(yas))
print(zscoreyas)


#orijinal hali ile zscore dönüşmüş halini karşılayalım

data.frame(yas,zscoreyas)


#kilo için ortalama ve standart sapma allaım

mean(kilo)
sd(kilo)

#kilo için zscore ortalamasını hesaplayalım

zscorekilo <- (kilo-mean(kilo))/(sd(kilo))
print(zscorekilo)

#orijinali ile normalize halini karşılaştıralım

data.frame(kilo,zscorekilo)


#boy için ortalama ve standart sapma alalım

mean(boy)
sd(boy)

#boy için zscore hesaplaması yapalım

zscoreboy <- (boy-mean(boy))/(sd(boy))
print(boy)

#boy normalize edilmiş haliyle ve orijinal haliye karışalştıralım

data.frame(boy,zscoreboy)





