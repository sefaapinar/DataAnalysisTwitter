#7.HAFTA Birliktelik Kurallari Uygulaması.
#Önce character seklinde cikan veri tipini numerik veriye donusturmeyi gorelim.

#ilk öncelikle excel'den verileri sistemimize çekelim.

veriler = read.table(file.choose(),header = T,sep = ";")

#daha sonrasında verilerimi gösterelim

str(veriler)

#Verileri dönüştürme işlemleri: 

is.factor(veriler$cinsiyet)
is.character(veriler$cinsiyet)

#verilerimizi factor'den karaktere donusturelim

veriler$cinsiyet <- as.character(veriler$cinsiyet)
veriler$kangruplari <- as.character(veriler$kangruplari)
str(veriler)

#verileri character'den factore dönüstürme

veriler$cinsiyet <- as.factor(veriler$cinsiyet)
veriler$kangruplari <- as.factor(veriler$kangruplari)

###7.HAFTA KONUSU BİRLİKTELİK KURALLARI

#Birliktelik kurallarında KULLANILAN PAKET #(ARULES)TİR.

install.packages("rpart")
install.packages("arules")   #BUrada paketleri yükledik ve kütüphanede aktif hale getirdik.
library(arules)

install.packages("arulesViz")
library(arulesViz)

#Bu paketin icinde birliktelik kurallari modelini elde etmek için " apriori() " fonksiyonu kullanılır.
#Guven olcutlerine gore siralanmis birliktelik kurallarini goruntulemek amaciyla "inspect()" fonksiyonu kullanılır

#R Programinin kendi icindeki data setlerinden "grocercies" data setini cagiralim

library(datasets)
data("Groceries")
summary(Groceries)


#Madde frekansini grafiğini kullanalım.
itemFrequencyPlot(Groceries,topN=10)

#kURALLARİ gÖRSELLEŞTİRMEK İÇİN ARULESVİZ KULLANILIR.
install.packages("arulesViz")
library(arulesViz)

#Birliktelik kurallarini elde etmek için birliktelik modelinin bulunması gerekir.
#Bunun için apriori() fonksiyonu kullanılır.

kurallar <- apriori(Groceries,parameter = list(supp=0.002, conf=0.75))

#elde edilen kurallari guven olcutune gore siralamak istiyoruz. Bunun icin sort() fonksiyonunu kullanalım.
#once elde edilecek rakamlarin hane sayisini azaltmak icin options(digit=2) biciminde bir tanim yapılır.


options(digits = 2)
kurallar <- sort(kurallar, by="confidence", decreasing = TRUE)

#Guven olcutune gore siralanmis birliktelik kurallarini goruntulemek amaciyla inspect()
inspect(kurallar[1:15])
#cikan ilk kurali yazalim.
#birinci kural, {citrus fruit, tropical fruit, root vegatables, whole milk} urunleri birlikte satin alan müsterilerin
#sayilanlar ile birlikte {other vegatables} urununu satin alma olasiliği %89 olarak degerlendirilir.


inspect(kurallar[1:5])


#supporta göre siralamak icin
options(digits = 2)
kurallar <- sort(kurallar, by="support", decreasing = TRUE)

inspect(kurallar[1:5])
#verilerimizi gorsellestirelim
library(arulesViz)
plot(kurallar)


