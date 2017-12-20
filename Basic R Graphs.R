data("iris")

table(iris$Species)

#Bivariate Analysis with Scatterplot
plot(iris$Sepal.Length ~ iris$Petal.Length)

plot(iris$Sepal.Length ~ iris$Petal.Length, ylab="Sepal Length", xlab="Petal Length", main ="Sepal Length vs Petal Length")

plot(iris$Sepal.Length ~ iris$Petal.Length, ylab="Sepal Length", xlab="Petal Length", main ="Sepal Length vs Petal Length",
     col = "blue", pch = 16)
#pch is for shape of the dots

#Univariate Analysis with Histogram
hist(iris$Sepal.Width)

hist(iris$Sepal.Width, main = "Distribution of Sepal Width", xlab="Sepal Width", col = "Red")

#Boxplot
#How continuous variable change with respect to categorical variable
boxplot(iris$Sepal.Length ~ iris$Species)
boxplot(iris$Sepal.Length ~ iris$Species, main = "Sepal Length of Different Species",
        xlab = "Species", ylab = "Sepal Length", col = "pink")

