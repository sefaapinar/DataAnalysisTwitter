# 6 ve 7. hafta vize calismasi-2

#once karakter tipinde cikan veri tipini numerik veriye donusturelim.

degiskenler = read.table(file.choose(), header = T,sep = ";")

str(degiskenler)

is.factor(degiskenler$cinsiyet)
is.character(degiskenler$cinsiyet)


# Verilerin faktorden karaktere donusturme

degerler$cinsiyet <-as.character(degerler$cinsiyet)

# characterden faktore donusturme

character$cinsiyet <-as.factor((degeler$cinsiyet))


#Birliktelik kurallari

# bu kurallari uygularken ilk oncelikle arules paketi indirilir.

install.packages("arules")
library(arules)


# R programın kendi icindeki data setlerinden Groceries data setini cagiralim

library(datasets)
data("Groceries")
summary(Groceries)

#kurallari gorsellestirmek icin genelde 
install.packages("arulesViz")
library(arulesViz)

#Birliktelik kuralini elde etmek icin birliktelik modelinin bulunması gerekir.

#bunun icin apriori() fonksiyonu kullanilir.

kural <-apriori(Groceries,parameter = list(supp=0.002, conf=0.75))

# elde edilen kurallari guven olcutune gore siralamak istiyoruz. bunun icin sort() fonksiyonu kullanalim. once elde edilecek rakalmlarin hane sayisini azaltmak icin options(digits=2) biciminde tanımlama ypaılır.

options(digits=2)
kural <-sort(kural, by="confidence", decreasing = T)

inspect(kural[1:15])


# supporta gore siralama islemi ise

options(digits = 2)

kural <-sort(kural, by="support",decreasing = T)
inpspect(kural[1:15])
