#12.hafta C4.5 karar agaclari uygulamasi
#RWeka Kullanilacak
#Bu paketi kurabilmek icin java yazilimi ve rJava isimli paketi kuralim
install.packages("RWeka")
library(RWeka)

#iris veri setini kullanacagiz
#ilk alt� gozlem degerine bakalim
#bunun icin head fonksiyonunu kullanabiliriz
head(iris)
data(iris)
View(iris)

#veri kumesinin herbir degiskeni veri madenciliginde oznitelik "atribute" olarak isimlendirilir.
str(iris)

#Rweka peketi icinde C4.5  algoritmasinin J48() isimli bir uyarlamasi yer almaktadir. 

modelC45 <- J48(Species~.,data = iris)

#kurallari gorelim
print(modelC45)

summary(modelC45)

#grafigini cizelim
plot(modelC45)

#ongoru icin predict fonksiyonundan yararlanacagiz

ongoru <- predict(modelC45)

ongoru [1:30]

#eger gercek veriler ile ongoru sonuclari birlikte gorulmek istenirse

data.frame(Species=iris$Species, ongoru=ongoru)[1:150,]

#yeni bir iris cicegi verisi geldiginde hangi sinifa gidecek tahmin edelim

yeni <- data.frame( Sepal.Length=4.1, Sepal.Width =3.2, Petal.Length=1.5, Petal.Width=1.2 )

#bu yeni gozlem degerinin hangi tur oldugunu bulalim
predict(modelC45,yeni)

