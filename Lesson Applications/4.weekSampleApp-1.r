
#vektor oluşturma

x <- c(23,44,55,1,2,3,44,54,22)

#vektoru çağırma
x

#vektorden min değerini bulma
min(x)

#vektörden maks değerini bulma
max(x)

#Min maks normalize değerini bulma

minmaknormalize <- (x-min(x))/(max(x)-min(x))
print(minmaknormalize)

#orijinal veri seti ile normalize olan veri setini kıyasalama 

data.frame(veri=x, normalize = minmaknormalize)



#zscore normalize hesaplanması yapımı

# ortalama bulalım

mean(x)

# standart sapma bulalım

sd(x)

# zscore normalizasyon işlemini yapalım

zscorenormalize <- (x-mean(x)/ sd(x))
print(zscorenormalize)

# zscore ile orijinal verinin kıyaslanmasına bakalım

data.frame(veri=x, zscore = zscorenormalize)











