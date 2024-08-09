data(airquality)
head(airquality)
str(airquality)
colSums(is.na(airquality))

colSums(is.na(airquality))
install.packages("dplyr")
library("dplyr")

airquality$Ozone <- ifelse(is.na(airquality$Ozone), median(airquality$Ozone, na.rm = TRUE), airquality$Ozone)
?ifelse
airquality$Solar.R<-ifelse(is.na(airquality$Solar.R),median(airquality$Solar.R, na.rm = TRUE),airquality$Solar.R)
colSums(is.na(airquality))
airquality$Month<-as.factor(airquality$Month)
airquality$Day<-as.factor(airquality$Day)
names(airquality)<-tolower(names(airquality))
View(airquality)
names(airquality)<-gsub("\\.","-",names(airquality))
airquality<-airquality%>%mutate(ozone_solar_ratio=ozone/`solar-r`)

airquality<- airquality[!duplicated(airquality),]
str(airquality)



ggplot(airquality, aes(x = 1:nrow(airquality), y = ozone)) +
  geom_line(color = "navy") +
  xlab("day") +
  ylab("ozone") +
  ggtitle("Time Series Plot of ozone Levels")


ggplot(airquality, aes(x = as.factor(month), y = ozone)) +
  geom_boxplot() +
  xlab("month") +
  ylab("ozone") +
  ggtitle("Boxplot of Ozone by Month")
       


ggplot(airquality, aes(x = temp)) +
  geom_histogram(binwidth = 1, fill = "violet", color = "white") +
  xlab("temperature") +
  ylab("count") +
  ggtitle("Histogram of Temperature")


ggplot(airquality, aes(x = wind, y = ozone)) +
  geom_point(color = "darkgreen") +
  xlab("wind") +
  ylab("ozone") +
  ggtitle("Scatter Plot of Ozone vs. Wind")

ggplot(airquality, aes(x = wind, y = ozone)) +
  geom_point() +
  facet_wrap(~ month) +
  xlab("Wind") +
  ylab("Ozone") +
  ggtitle("Ozone vs Wind by Month")
