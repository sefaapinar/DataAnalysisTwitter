#Sefanur Pınar 4.Hafta Odev Tekrarı

######## 4.HAFTA TEKRAR ########

#ilk once paketlerimizi kuralim.

install.packages("rpart")
library(rpart)

#veri tiplerinden bahsedelim.

#is.numeric, is.character, is.vector, is.factor, is.matrix, is.data.frame

#view() komutu olusturdugumuz nesnelerin farklı bir pencerede goruntulenmesini saglar.

#min maks normalizasyonundan baslaylim.

#ilk once vektor olusturalım.

sayilar <-c(10,23,4,5,61,20)
sayilar

min(sayilar)
max(sayilar)

# min maks normalizasoyunun hesaplayalim

min_maksnormalize <-(sayilar-min(sayilar))/(max(sayilar)-min(sayilar))
print(min_maksnormalize)

#orijinal veri ile normalize olan veriyi karsilastiralim.

data.frame(sayilar,min_maksnormalize)

#ZSCORE HESAPLAMASI 

# ilk önce dizinin ortalamasını ve standart sapmasını almamız lazım.

mean(sayilar)

#standart sapma

sd(sayilar)

#zscore hesaplaması

zscorenormalize <-(sayilar-mean(sayilar))/(sd(sayilar))
print(zscorenormalize)

#orijinal veri ile normal veriyi kiyasalayalim.

data.frame(zscorenormalize,sayilar)





########## 5.HAFTA TEKRAR ##########


#karater tipinde veriler olusturma

ogrenci <-c("Sefa","Ahmet","Yasin","Sergen","Anıl")

ogrenci


#numeric vektor olusturma

y <-c(23,4,55)

y

#faktor tipinde veri olusturma

fct <-factor(c("erkek","kadın","erkek","erkek","kadın"))
fct

#mantiksal bir veri tipi olusturma

sinifgecme <-c("gecti","kaldi","gecti")
sinifgecme

# KULLANDİGİMİZ BAZİ FONKSİYONLAR

# data.frame() = listeleme islemleri yapilir.
# attach() = fonksiyonu veri setine eklemek icin kullanilir
# detach() = fonksiyonu calistirmadan kaldirmak icin kullanilir.


# VERİ SETİNİ CEKME.

veriler = read.table(file.choose(), header = T, sep = ";")

str(veriler)

summary(veriler)

min(veriler$yas)
attach(veriler)
max(veriler$yas)

#yas icin normalize degerlerini bulalim.

yasnormalize <-(yas-min(yas))/(max(yas)-min(yas))
print(yasnormalize)

#kilo icin min maks 
min(kilo)
max(kilo)

# kilo icin normalize degerleri bulalim

kilonormalize <-(kilo-min(kilo))/(max(kilo)-min(kilo))
print(kilonormalize)

# boy icin min ve maks degerlerini bulalim ve normalize edelim.

min(boy)
max(boy)


boynormalize <-(boy-min(boy))/(max(boy)-min(boy))
print(boynormalize)


# hazırladıgımız 3 normalizeyi de listeyelim.

data.frame(boynormalize,kilonormalize,yasnormalize)

# zscore normalize

# ilk önce detach() diyerek eklediğimiz fonksiyonu geri kaldırıyoruz.

detach(veriler)

mean(veriler$yas)

# veri setine entegre etmek icin attach fonksiyonunu kullanalim.

attach(veriler)

#ortalama alalim
mean(yas)

#standart sapma alimi
sd(yas)


#ZSCORE HESAPLAMALARİ.

#yas icin zscore hesaplamasi yapalim.

yaszcore <-(yas-mean(yas))/sd(yas)
print(yaszcore)


#kilo icin zscore yapalim tabi önce ortalamasi ve standart sapmasini alalim.

detach(veriler)


mean(veriler$yas)

attach(veriler)

mean(kilo)

sd(kilo)

#kilo icin zscore hesaplamasi yapalim

kilozscore <-(kilo - mean(kilo))/sd(kilo)
print(kilozscore)


#boy icin zscore hesaplamasi yapalim

mean(boy)

sd(boy)


zscoreboy <-(boy-mean(boy))/sd(boy)
print(boy)

data.frame(boy,zscoreboy)







########## 6-7.HAFTA BİRLİKTELİK KURALLARİ ##########


#veri donusturme islemleri :

veriler = read.table(file.choose(), header = T,sep = ";")

is.factor(veriler$yas)
is.character(veriler$yas)


#veirleri faktorden karaktere donusturme

veriler$yas <- as.character(veriler$yas)

# verileri karakterden faktore donusturme

veriler$yas <-as.factor(veriler$yas)


# BİRLİKTELİK KURALLARİ

# kurallari kullanmak icin arules paketi kullanilir.

install.packages("arules")
library(arules)

# R Programinin kendi icindeki data setlerinden olan Groceries data setini cagiralim.
library(datasets)
data("Groceries")
summary(Groceries)


#kurallarig gorsellestirmek icin arulesViz kullanilir.

install.packages("arulesViz")
library(arulesViz)

#BİRLİKTELİK KURALLARİNİN ELDE ETMEK İCİN BİRLİKTELİK MODELİNİN BULUNMASI GEREKİR.

#bu modelin bulunmasi icin apriori() fonksiyonu kullanilir.

kural <-apriori(Groceries,parameter = list(supp:0.022, conf=0.75))

options(digits = 2)

kural <-sort(kural, by="support",decreasing = T)

inspect(kural[1:10])



options(digits = 2)

kural <-apiori(Groceries,parameter=list(sup=123, conf=123))

kural <-sort(kural,by="confidence", decreasing = T)

inspect(kural[1:2])















