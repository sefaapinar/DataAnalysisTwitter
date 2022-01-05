#Sefanur Pınar 7.Hafta Derste Yapılan Örnekler.



#Veriler ile çalışacağımız sistemimizi yükleyelim.
degerler = read.table(file.choose(),header = T,sep = ";")
str(degerler)

# ilk öncelikle veri tiplerini dönüştürelim

is.factor(degerler$boy)
is.character(degerler$boy)

#verileri factor'den karaktere dönüştürelim.

degerler$boy <- as.character(degerler$boy)

#verileri characterden factore dönüştürme
degerler$boy <- as.factor(degerler$boy)


str(degerler)


#Birliktelik Kurallarini Yazmaya Başlayalım.

#ilk önce kullanacağımız paketleri yükleyleim.

install.packages("arules")
library(arules)

#r programin kendi icindeki data setlerinden Groceries data setini cagiralim.
library(datasets)
data("Groceries")
summary(Groceries)

#madde frekans grafigini görelim

itemFrequencyPlot(Groceries, topN=10)

#KURALLARI GÖRSELLŞTİRMEK İÇİN ARULESVİZ
install.packages("arulesViz")
library(arulesViz)


#Birliktelik kurallarını elde etmek için birliktelik kmodelinin bulunmasi gerekir.
#bunun için apriori() kullanılır.


kural <-apriori(Groceries, parameter= list(supp=0.002, conf=0.75))
rules <- apriori(Groceries, parameters = list(supp=0.003, conf = 0.74))

#elde edilen kullari guven olcütüne göre siralamak istiyoruz. Bunun icin sort() komutu kullanılır. önce elde edilecek rakamlarin hane sayısını azaltmak icin digits foknsiyonu kullanmak gerekir

options(digits = 2)


kural <- sort(kural, by = "confident", decreasing = T)

inspect(kural[1:10])


#supporta göre siralamak için genelde 


rules <- sort(rules, by="support", decreasing = T)

inspect(rules[1:10])


#@@@@@@@@@@@qqq



# yeni bir liste oluşturmak için ve yeni bir kural oluşturmak için

data("Result")


kural <- apriori(Result, parameter = list(supp=0.5, conf = 0.7, target="kural"))

summary(kural)

options(digits = 2)

kural <- sort(kural, by="confident", decreasing = T)

inspect(kural[1:15])


#yeni bir liste daha oluşturalım


data("Mining")

kural <- apriori(Mining, parameter = list(supp=0.2, conf=0.4,   target="kural"))

summary(kural)

options(digits = 2)

kural <- sort(kural, by="support",  decreasing = T)

inspect(kural[1:5])


#ogrenci tipinde vektor olusturalım

ogrenci <-c("Mehmet","Sefa")
ogrenci



numbers <-c(12,3,4,5,11,23,45,6)
numbers


degerler = read.table(file.choose(), header = T,sep = ";")


min(degerler$yas)

attach(degerler)
min(yas)
max(yas)

#yas icin min maks normalizasyonu

normalize <-(yas-min(yas))/(max(yas)-min(yas))
print(normalize)


#yas icin zscore hespalaması

mean(veriler$yas)

attach(veriler)


mean(yas)
sd(yas)

#yas icin normalizasyon

normalizezscore <-(yas-mean(yas))/ (sd(yas))

print(normalizezscore)




data.frame(yas,normalize)























