#7.hafta Ornek Calisma Uygulamalarim

#veri dönüştürme işlemleri

deger = read.table(file.choose(),header = T,sep = ";")
str(deger)

#verileri factor'den karaktere donusturme

veriler$cinsiyet <-as.character(veriler$cinsiyet)
veriler$cinsiyet <-as.factor(veriler$cinsiyet)

#verileri characterden factor'e donusturme islemi

veriler$cinsiyet <-as.character(veriler$cinsiyet)
veriler$cinsiyet <-as.factor(veriler$cinsiyet)


str(veriler)


#BİRLİKTELİK KURALLARI ÖRNEKLERİ

#Birliktelik kurallarinda "arules" paketi kurulur.
#Bu paketin icinde birliktelik kurallari modelini elde etmek icin
# "apriori() fonksiyonu kullanılabilir.
# Once paketleri yukleyip sonra kutuphaneden cagirmaliyiz.
#Guven olcutlerine gore siralanmis birliktelik kurallarini goruntulemek amaciyla inspect() fonksiyonu kullanilir.

#İlk önce projemize arules paketini kuralım.

install.packages("arules")
library(arules)

# R programin kendi icindeki data setlerinden "Groceries" data setini cagiralim 

library(datasets)
data("Groceries")
summary(Groceries)

#madde frekansini grafigini gorelim.

itemFrequencyPlot(Groceries,topn=10)

#Kurallari gorsellestirmek icin arulesViz packeti kullanilir.

install.packages("arulesViz")
library(arulesViz)


#Birliktelik kUrallarini elde etmek icin birliktelik modelinin bulunmasi gerekir.
#Bunun icin apriori() modeli kullanılır.

kural <- apriori(Groceries,parameter= list(supp=0.002, conf=0.75))

#elde edilen kurallari guven olcutune gore siralak istiyoruz bunu icin "sort()" komutu kullanılır
# once elde edilecek rakamlarin hane sayilarini hazıralamak icin  options(digits=2) biciminde bir tanim yapilir.

options(digits = 2)

kural <- sort(kural, by="confidence", decreasing =T)

#Guven olcutune göre siralanmıis birliktelik kurallarini gormek adına inspect() kullanılır.

inspect(kural[1:15])

#cikan ilk kurali yazalim


#support' degerine gore siralamak icin ise:

options(digits = 2)
kural <- sort(kural, by="support",decreasing = T)
inspect(kural[1:14])

#cektiğimiz veriyi görsellestirelim

library(arulesViz)
plot(kural)



 # kural <- apriori(Groceries, parameter = list(supp=0.008, conf=0.74))





