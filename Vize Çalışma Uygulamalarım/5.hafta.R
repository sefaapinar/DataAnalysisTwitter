#5.Hafta Ornek Calisma uygulamalarim.

#karakter tiplerinde veriler olusturma

isimler <-c("Ahmet","Fatih","Melih","Zehra","Fatma")
isimler

#numerik tipte veriler olusturma

sayilar <-c(12,33,41,56,76,23,1)
sayilar

#faktor tipinde veriler olusturma

cinsiyet <-factor(c("erkek","kadın","kadın","erkek"))
cinsiyet

#mantiksal veri tipi olusturma

sinifgecme <-c("gecti","kaldi","gecti","kaldi")
sinifgecme

#fonksiyonlardan biraz bahsedelim.
#data.frame() = listeleri gösteren fonksiyondur.
#attach() = fonksiyonu veri setini eklemek icin kullanilir.
#detach() = fonksiyonu calismadan kaldirmak icin kullanilir.



# csv dosyali olan sistemlerin r studio'ya yuklenmesi.

veriler = read.table(file.choose(), header = T, sep = ";")

# eklediğimiz verileri ekranda göstermek.

str(veriler)

#verilerin deger tiplerinin özetlerini gösterir.
summary(veriler)

#veri setinde bulunan yas degiskeninin min ve maks degerlerini bulalim

min(veriler$yas)
max(veriler$yas)

attach(veriler)

min(yas)
max(yas)

# veri setimizde bulunan yas icin min-maks normalizasyonunu bulalim.

normalize <-(yas-min(yas))/(max(yas)-min(yas))
print(normalize)

# boy icin min maks bulalım

boynormalize <-(boy-min(boy))/(max(boy)-min(boy))
print(boynormalize)

# kilo icin min maks bulalim

kilonormalize <-(kilo-min(kilo))/(max(kilo)-min(kilo))
print(kilonormalize)

# olusturdugumuz uc normalizasyonu liste halinde gorelim.

data.frame(kilonormalize,boynormalize,normalize)
data.frame(yas,normalize)

#zscore normalizasyonu

detach(veriler)

mean(veriler$yas)

#veri setine entegre etmek için attach fonksiyonunu kullanalim.

attach(veriler)

# Ortalama alalim

mean(yas)

# standart sapma alalim

sd(yas)

# yas icin zscore normalizasyonunu ele alalim

zscoreyas <-(yas-mean(yas))/sd(yas)
print(yas)

# orijinal yas ve normalize yasi kiyaslayalim

data.frame(yas,zscore)

# kilo icin ortalama ve standartsapma alalim

mean(kilo)

sd(kilo)

# kilo icin zscore normalizasyonunu yapalım

kilozscore <-(kilo - mean(kilo))/sd(kilo)
print(kilozscore)

# normal kilo ile zscore kiloyu karsilastiralim.
data.frame(kilo,kilozscore)


# boy icin ortalama ve sd alalim

mean(boy)

sd(boy)

# boy icin normalize yapalim

zscoreboy <-(boy-mean(boy))/sd(boy)
print(zscoreboy)

# orijinal veri ile normalize veriyi karsilastiralim.

data.frame(boy,zscoreboy)















































































