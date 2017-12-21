#ggplot2(Grammar of Graphics)

install.packages("ggplot2")
library(ggplot2)

#Components of Grammar of Graphics
#Data - Dataset for which we want to plot a graph
#Aesthetics - Metrics onto which we plot the data
#Geometry - Visual Elements to plot the data
#Facet - Group by which we divide the data

ggplot(data = iris)
ggplot(data = iris, aes(y=Sepal.Length, x=Petal.Length))
#geom_point will give us scatterplot
ggplot(data = iris, aes(y=Sepal.Length, x=Petal.Length))+geom_point()

#Aesthetics
ggplot(data = iris, aes(y=Sepal.Length, x=Petal.Length, col = Species))+geom_point()
ggplot(data = iris, aes(y=Sepal.Length, x=Petal.Length, shape = Species))+geom_point()
ggplot(data = iris, aes(y=Sepal.Length, x=Petal.Length, col = Species, shape = Species))+geom_point()



houserates <- read.csv(url("https://raw.githubusercontent.com/ywchiu/riii/master/data/house-prices.csv"))
install.packages("dplyr")
library(dplyr)
houserates %>% select(c(-1)) -> house

#Histogram
ggplot(data = house, aes(x=Price))+geom_histogram()
ggplot(data = house, aes(x=Price))+geom_histogram(bins = 50)
ggplot(data = house, aes(x=Price))+geom_histogram(bins = 50, fill = "blue", col="yellow")

#Position (position = fill will give proportion instead of count)
ggplot(data = house, aes(x=Price, fill = Brick))+geom_histogram()
ggplot(data = house, aes(x=Price, fill = Brick))+geom_histogram(position = "fill")

#When to use Histogram and Barplot
#Histigram - Distribution of continuous variable
#Barplot - Distribution of categorical variable

#Barplot
ggplot(data=house, aes(x=Bathrooms, fill=Brick))+geom_bar(position = "fill")
ggplot(data=house, aes(x=Bathrooms, fill=Neighborhood))+geom_bar(position = "fill")


#Frequency-Ploygon 
#Distribution of continuous variable
ggplot(data = house, aes(x=Price))+geom_freqpoly()
ggplot(data = house, aes(x=Price))+geom_freqpoly(bins=60)
ggplot(data = house, aes(x=Price, col=Brick))+geom_freqpoly(bins=20)


#Box-Plot
#How does continuous variable change with respect to categorica variable
ggplot(data=house, aes(x=factor(Bedrooms), y = Price))+geom_boxplot()
ggplot(data=house, aes(x=factor(Bedrooms), y = Price, fill=factor(Bedrooms)))+geom_boxplot()
ggplot(data=house, aes(x=factor(Bedrooms), y = Price, fill=Brick))+geom_boxplot()
ggplot(data=house, aes(x=factor(Bedrooms), y = Price, fill=Neighborhood))+geom_boxplot()


#Smooth-Line
#How does one continuous variable change with respect to another continuous variable
ggplot(data=house, aes(x=SqFt, y = Price))+geom_smooth()
#Grey Area indicates error. We can remove it using se=F
ggplot(data=house, aes(x=SqFt, y = Price))+geom_smooth(se=F)
ggplot(data=house, aes(x=SqFt, y = Price, col = Brick))+geom_smooth(se=F)
ggplot(data=house, aes(x=SqFt, y = Price, col = Neighborhood))+geom_smooth(se=F)


ggplot(data=house, aes(x=SqFt, y = Price))+geom_point()+geom_smooth(method = "lm",se=F)
ggplot(data=house, aes(x=SqFt, y = Price,col = Brick))+geom_point()+geom_smooth(method = "lm",se=F)



#FACETING
ggplot(data=house, aes(x=SqFt, y = Price,col = Brick))+geom_point()+geom_smooth(method = "lm",se=F)+
  facet_grid(~Brick)

#Adding Themes
ggplot(data=house, aes(x=factor(Bedrooms), y = Price, fill=factor(Bedrooms)))+geom_boxplot() -> obj1
obj1+labs(title="Price w.r.t Bedrooms", x = "Bedrooms", fill="Bedrooms")->obj2
obj2+theme(panel.background = element_rect(fill="pink"))->obj3
obj3+theme(plot.title = element_text(hjust = 0.5, face = "bold", colour = "blue"))

#Theme 2
ggplot(data=house, aes(x=SqFt, y = Price,col = Brick))+geom_point()+geom_smooth(method = "lm",se=F)+
  facet_grid(~Brick)-> o1
o1+theme(panel.background = element_rect(fill = "lemonchiffon2"))->o2
o2+theme(legend.background = element_rect(fill = "cyan"))->o3
o3+theme(plot.background = element_rect(fill = "coral"))

#Theme 3
ggplot(data = house, aes(x=Price, col=Brick))+geom_freqpoly(size =1,bins=20)->g1
g1+theme(panel.background = element_rect(fill="peachpuff"))->g2
g2+labs(title="Frequency Polygon for Price")->g3
g3+theme(plot.title = element_text(hjust = 0.5), plot.background = element_rect("yellow"))
