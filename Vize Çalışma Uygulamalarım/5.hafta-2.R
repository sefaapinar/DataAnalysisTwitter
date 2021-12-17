#5.hafta Vize Calismasi 2

#karater tiplerinde vector olusturalim

isim <-c("sefa","ahmet","mehmet","anıl","yasin")
isim

#numerik tipde veri olusturalim

sayi <-c(43,22,65,34,89)
sayi

#faktor tiplerinde vector olusturma

cinsiyet <-factor(c("erkek","kız","erkek","kız","kız"))
cinsiyet

#faktor veri tipine bir ornek verelim

derece <-factor(c("Sıcak","Soguk","Sıcak","Soguk","Sıcak"))
derece

#mantiksal tipte bir veri olusturalim
sinifgecme <-c("gecti","kaldı","sorumlu")
sinifgecme


#FONKSIYONLAR

#data.frame = veri listelerinig gosterir.
#attach() = fonksiyonu veri setine eklemek icin kullanilir.
#detach() = fonksiyonu calismadan kaldirmak icin kullanilir.



#Onemli noktalardan bir tanesi ve sınavda karsimiza gelecek.

#RStudio programına veri seti eklemek.

data = read.table(file.choose(), header = T, sep = ";")

#ekledigimiz veri setini listeleyelim.
str(data)

#karakter tiplerini gorelim, ozetleyelim
summary(data)

#veri setlerinde bulunan degiskenlerin min ve maks degerlerini bulalim

#yas icin min-maks

min(data$yas)
attach(data)
min(yas)
max(yas)

# yas icin min maks normalizasyonunu bulalim

normalizeyas <-(yas-min(yas))/(max(yas)-min(yas))
print(normalizeyas)

# kilo icin min maks normalize bulalim

# ilk once min ve maks degerlerini alalim

min(kilo)
max(kilo)

# kilo icin normalize islemi

normalizekilo <-(kilo - min(kilo))/(max(kilo)-min(kilo))
print(normalizekilo)

# boy icin normalize islemini yapalim

# ilk once min ve maks degerlerini bulalim

normalizeboy <-(boy - min(boy))/(max(boy)-min(boy))
print(normalizeboy)

# uc normalize liste halinde gormek

data.frame(normalizeboy,normalizekilo,normalizeyas)


#zscore normalizasyon olaylari.

#detach() fonksiyonu kullanalim
detach()

mean(data$yas)

#veri setine entegre etmek icin attach() fonksiyonu kullanalim.

attach(data)

#ortalama alalim
mean(yas)

#standart sapma
sd(yas)

#yas icin zscore normalizasyonu

zscoreyas <-(yas-mean(yas))/sd(yas)
print(zscoreyas)

#orijinal veri ile normalize yas verisini gorelim.

data.frame(yas,zscoreyas)

# kilo icin zscore normalizasyonu

# ortalama ve standart sapma alalim.

mean(kilo)

sd(kilo)


zscorekilo <-(kilo-mean(kilo))/sd(kilo)
print(kilo)


data.frame(kilo,zscorekilo)


# boy icin yapalim

mean(boy)

sd(boy)

zscoreboy <-(boy - mean(boy))/sd(boy)
print(boy)


data.frame(boy,zscoreboy)































































































