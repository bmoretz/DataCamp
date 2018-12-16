library(datasets)
library(xts)
library(ggplot2)
library(broom)
library(magrittr)

# XTS using AirPassengers base R data

ap.xts <- as.xts(AirPassengers)
mseries <- cbind(ap.xts, rollmean(ap.xts, 7)) # mseries is a xts object with multiple variables
names(mseries) <- c("Passengers", "MA_Passengers") # names for the series, otherwise the names are '..1' and '..2'
index(mseries) <- as.Date(index(mseries)) # to avoid warnings since ggplot scale don't handle yearmon natively
tidy(mseries) %>% ggplot(aes(x = index, y = value, color = series)) + geom_line()