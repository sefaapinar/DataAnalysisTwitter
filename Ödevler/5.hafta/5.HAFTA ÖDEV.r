#5.Hafta Ödev


#İlk öncelikle excelde bulunan verilerimizi çekiyoruz.
veriler = read.table(file.choose(),header = T,sep =";")
str(veriler)

summary(veriler)

#veri setinde bulunan evet hayır değerlerinin min ve maks değerlerini bulalım.

min(veriler$Olumlu)

attach(veriler)
min(Olumlu)
max(Olumlu)

#Evet Oy oranları için min maks normalizasyonu
evetnormalize <-(Olumlu-min(Olumlu))/(max(Olumlu)-min(Olumlu))
print(evetnormalize)

#Hayır icin min maks buluyoruz.
min(Olumsuz)
max(Olumsuz)


#Hayır Oy oranları için min maks normalizasyonu
hayirnormalize <-(olumsuz-min(olumsuz))/(max(olumsuz)-min(olumsuz))
print(hayirnormalize)


data.frame(evetnormalize,hayirnormalize)
data.frame(Olumlu,evetnormalize)
data.frame(Olumsuz,hayirnormalize)


#ZScore Normalizasyonu

detach(veriler)

mean(veriler$Olumlu)

#Veri setlerini entegreli bir şekilde kullanmak için attach fonksiyonu kullanılır.
attach(veriler)

#ortalama alimi

mean(veriler$Olumlu)

#Standartsapma
sd(Olumlu)


#Evet oranları için yani Olumlu sonuçlar için zscore 

zscoreOlumlu <-(Olumlu-mean(Olumlu))/sd(Olumlu)
print(zscoreOlumlu)

#Verilerin orijinal hali ve zscore hallerini görelim.

data.frame(Olumlu,zscoreOlumlu)

#Hayır, Olumsuz veriler için yapalım.
mean(Olumsuz)
sd(Olumsuz)

#ZSCORE
zscoreOlumsuz <-(Olumsuz-mean(Olumsuz))/sd(Olumsuz)
print(zscoreOlumsuz)

#Verilerin orijinali ile listeyelim.

data.frame(Olumsuz,zscoreOlumsuz)
