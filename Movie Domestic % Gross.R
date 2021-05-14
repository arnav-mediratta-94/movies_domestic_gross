#Read data from the csv

moviesData <- read.csv("Section6-Homework-Data.csv")
str(moviesData)
summary (moviesData)
View(moviesData)

#Filter out the data that is not needed
filter <- ((moviesData$Studio==("Buena Vista Studios")|moviesData$Studio==("Sony")|moviesData$Studio=="Fox"|moviesData$Studio=="Paramount Pictures"|moviesData$Studio=="Universal"|moviesData$Studio=="WB")&((moviesData$Genre == "action"|moviesData$Genre == "action"|moviesData$Genre == "animation"|moviesData$Genre == "adventure"|moviesData$Genre == "comedy"|moviesData$Genre == "drama")))
newMoviesData <- moviesData[filter,]
View(newMoviesData)
#Change coloumn names to make them more useable
colnames(newMoviesData) = c("DaysOfWeek","Director","Genre","Title","ReleaseDate",
                         "Studio","AdjustedGross","Budget","Gross","IMDbRating",
                         "MovieLensRating","OverseasEarnings","OverseasPercent",
                         "Profit","ProfitPercent","Runtime","USEarnings",
                         "USGrossPercent")
# Add the Libraries to be used

library(ggplot2)
install.packages("extrafont")
library(extrafont)
font_import("C:/Windows/Fonts")
loadfonts(device = "win") 

# Plot the basic graph

ggplot(data = newMoviesData,aes(x = Genre, y = USGrossPercent, size = Budget, color=Genre))+
  geom_point()

# Adding layers to the graph

graph <- ggplot(data = newMoviesData, aes(x = Genre, y = USGrossPercent, color=Studio), size = 1)

graph + geom_boxplot()

#adding scatter plot to box plot

graph + geom_boxplot() + geom_jitter()

#Changing the size of the scatter points

graph + geom_boxplot() + geom_jitter(size = 1)

# Moving the points under the box plot

graph + geom_jitter(size = 1) + geom_boxplot()

# Adding transparency and color to the boxplot

graph + 
  geom_jitter(aes(size = Budget)) + 
  geom_boxplot(color = "black", alpha = 0.5)

# Adding Theme

graph + 
  labs(size = "Budget $M")+
  geom_jitter(aes(size = Budget)) + 
  geom_boxplot(color = "black", alpha = 0.7)+
  xlab("Genre")+
  ylab("Gross % US")+
  ggtitle("Domestic Gross % by Genre")+
  theme(axis.title = element_text(color = "Dark Blue",family = "Comic Sans MS",size = 20),
        legend.text =  element_text(size=7,family = "Comic Sans MS" ),
        axis.text = element_text(family = "Comic Sans MS",size = 20),
        title = element_text(family = "Comic Sans MS"),
        plot.title = element_text(hjust = 0.5))
