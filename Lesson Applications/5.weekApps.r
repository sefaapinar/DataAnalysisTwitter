# 5.hafta data mining uygulamalar.

#karakter tipinde veri tipi oluşturalım.

ogrenci <-c("Sefa","Betul","Mehmet","Furkan","Samet","Fehmi")

x <- c(41,58,22,38,26,11)

#numerik vector oluşturma
 y <- c(23,12,45)
 
 #faktor tipinde veri oluşturalım
 
 cinsiyet <- factor(c("erkek","kadın","kadın","erkek"))
 
 cinsiyet
 
 #mantıksal bir tip de veri tipi oluşturalım
 
 sinifgecme <-c("gecti","kaldı","gecti")
 sinifgecme
 
 #fonksiyonlar Konusu
 
 #data.frame() listeleri gösterir.
 #attach() fonksiyonu veri setini eklemek için kullanılır.
 #detach() fonksiyonu calismadan kaldirmak için kullanılır.
 
# .csv uzantılı dosyaları sisteme yüklemek.
 
 veriler = read.table(file.choose(),header=T,sep=";") 
 
 
 # veri setinde ki degiskenlerin veri tiplerini görmek için kullanilir.
 
 str(veriler)
 
 summary(veriler)
 
 #veri setinde bulunan yas degiskeninin min ve maks degerlerini bulalım
 
 min(veriler$yas)
 
 attach(veriler)
 min(yas)
 max(yas)
 
 
 #yas icin min maks normalizasyonu
 
 yasnormalize <- (yas-min(yas))/(max(yas)-min(yas))
 print(yasnormalize)
 
 #boy icin min ve maks degerlerini bulalım
 
 min(boy)
 max(boy)
 
 #boy icin min ve maks degelerini bulalım
 
 boynormalize <-(boy-min(boy))/(max(boy)-min(boy))
 print(boynormalize)
 
 #kilo icin min ve maks degerlerini bulalım
 
 kilonormalize <- (kilo-min(kilo))/(max(kilo)-(min(kilo))
 print(kilonormalize)
 
 
 # oluşturduğumuz üç normalizasyonu listeler halinde görelim
 data.frame(yasnormalize,kilonormalize,boynormalize)
 
 
 #zscore normalize işlemleri
 
 #detach fonksiyonunu kullanalım.
 
 detach(veriler)
 
 mean(veriler$yas)
 
 #veri setine entegre etmek için attach foknsiyonu kullanılır
 
 attach(veriler)
 mean(yas)
 
 #standart sapma alalım
 sd(yas)
 
 #yas icin zscore normalizasyonunu yapalım
 
 zscoreyas <- (yas-mean(yas))/(sd(yas))
 print(zscoreyas)
 
 #orijinal veri ile zscore aldığımız verileri karşılaştıralım. 
 
 data.frame(yas,zscoreyas)
 
 #boy için ortalama ve standart sapma alalım
 
 mean(boy)
 sd(boy)
 
 #boy için zscore normalizasyonu yapalim
 
 zscoreboy <-(boy-mean(boy)) / (sd(boy))
 print(zscoreboy)
 
 #orijinal boy ile normalize boyu karşılaştıralım
 
 data.frame(boy,zscore)
 
 
 #kilo için ortalama ve standart sapma alalım
 mean(kilo)
 sd(kilo)
 
 # kilo için zscore normalizasyonu yapalim
 
 zscorekilo <- (kilo-mean(kilo))/(sd(kilo))
 print(zscorekilo)
 
 # normalize hali ve orijinal halini karşılaştıralım.
 
 data.frame(kilo,zscorekilo)
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 