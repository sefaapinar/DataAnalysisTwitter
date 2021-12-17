#4.Hafta Ornek Calisma uygulamalarim.

#ilk oncelikle r paketimizi kuralım.

install.packages("rpart")
library(rpart)

#veri tiplerinden bahsetmek gerekirse
#is.numeric - numerik sayilar için geçerlidir.
#is.character - karakter kullanimi için geçerlidir.
#is.vector - vector kullanimi için geçerlidir.
#is.matrix - matrix kullanimi için kullanilir.
#is.data.frame - verileri listelemel için kullanılır
#view() oluşturduğumuz verilerin farklı bir sayfa da veya pencere de görüntülenmesini sağlar.

#Min - Maks Normalizasyonunu oluşturalım ve vektör degerleri oluşturalım.

x <-c(10,20,30,40,60,4)
x

#yukarida x vektoru oluşturduk ve vektoru cagirdik.
#simdi min ve maks ifadelerini alalım.

min(x)
max(x)


#min maks normalizasyon uygulamasini yapalım.

xminmaks <- (x - min(x))/(max(x)-min(x))
print(xminmaks)

#orijinal veri seti ile normalize veriyi karsilastiralim

data.frame(veri = x, normalize = xminmaks)


#ZSCORE normalizasyonu yapmak.

#ilk önce ortalamarını ve standart sapmalarını alalim

mean(x)
sd(x)

# zscore normalizasyon yapalım.

zscorenormalize <- (x - mean(x))/sd(x)
print(zscorenormalize)

#orijinal veriler ile normalize olan verileri karşılaştıralım.

data.frame(deger = x, normalize = zscorenormalize)

