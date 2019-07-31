library(ggplot2)
library(broom)
library(sigr)
library(dplyr)
library(vtreat)
library(WVPlots)
library(tidyr)
library(ranger)
library(magrittr)

bikes <- load("Bikes.RData")

# bikesJuly is in the workspace
str(bikesJuly)

# Random seed to reproduce results
seed <- 423563

# The outcome column
(outcome <- "cnt")

# The input variables
(vars <- c("hr", "holiday", "workingday", "weathersit", "temp", "atemp", "hum", "windspeed"))

# Create the formula string for bikes rented as a function of the inputs
(fmla <- paste(outcome, "~", paste(vars, collapse = " + ")))

seed

# Load the package ranger
library(ranger)

# Fit and print the random forest model
(bike_model_rf <- ranger(fmla, # formula 
                         bikesJuly, # data
                         num.trees = 500,
                         respect.unordered.factors = "order",
                         seed = seed))

# bikesAugust is in the workspace
str(bikesAugust)

# bike_model_rf is in the workspace
bike_model_rf

# Make predictions on the August data
bikesAugust$pred <- predict(bike_model_rf, bikesAugust)$predictions

# Calculate the RMSE of the predictions
bikesAugust %>%
  mutate(residual = cnt - pred) %>% # calculate the residual
  summarize(rmse = sqrt(mean(residual ^ 2))) # calculate rmse

# Plot actual outcome vs predictions (predictions on x-axis)
ggplot(bikesAugust, aes(x = pred, y = cnt)) +
  geom_point() +
  geom_abline()

first_two_weeks <- bikesAugust %>%
  # Set start to 0, convert unit to days
  mutate(instant = (instant - min(instant)) / 24) %>%
  # Gather cnt and pred into a column named value with key valuetype
  gather(key = valuetype, value = value, cnt, pred) %>%
  # Filter for rows in the first two
  filter(instant < 14)

# Plot predictions and cnt by date/time 
ggplot(first_two_weeks, aes(x = instant, y = value, color = valuetype, linetype = valuetype)) +
  geom_point() +
  geom_line() +
  scale_x_continuous("Day", breaks = 0:14, labels = 0:14) +
  scale_color_brewer(palette = "Dark2") +
  ggtitle("Predicted August bike rentals, Random Forest plot")

# The outcome column
(outcome <- "cnt")

# The input columns
(vars <- c("hr", "holiday", "workingday", "weathersit", "temp", "atemp", "hum", "windspeed"))

# Load the package vtreat
library(vtreat)

# Create the treatment plan from bikesJuly (the training data)
treatplan <- designTreatmentsZ(bikesJuly, vars, verbose = FALSE)

# Get the "clean" and "lev" variables from the scoreFrame
(newvars <- treatplan %>%
  use_series(scoreFrame) %>%
  filter(code %in% c("clean", "lev")) %>% # get the rows you care about
  use_series("varName")) # get the varName column

# Prepare the training data
bikesJuly.treat <- prepare(treatplan, bikesJuly, varRestriction = newvars)

# Prepare the test data
bikesAugust.treat <- prepare(treatplan, bikesAugust, varRestriction = newvars)

# Call str() on the treated data
str(bikesJuly.treat)
str(bikesAugust.treat)

library(xgboost)

# Run xgb.cv
cv <- xgb.cv(data = as.matrix(bikesJuly.treat),
            label = bikesJuly$cnt,
            nrounds = 100,
            nfold = 5,
            objective = "reg:linear",
            eta = 0.3,
            max_depth = 6,
            early_stopping_rounds = 10,
            verbose = 0 # silent
)

# Get the evaluation log 
elog <- cv$evaluation_log

# Determine and print how many trees minimize training and test error
elog %>%
   summarize(ntrees.train = which.min(train_rmse_mean), # find the index of min(train_rmse_mean)
             ntrees.test = which.min(test_rmse_mean)) # find the index of min(test_rmse_mean)

