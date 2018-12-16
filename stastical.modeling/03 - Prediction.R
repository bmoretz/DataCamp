library(rpart)
library(mosaicData)
library(statisticalModeling)
library(MASS)

attach(CPS85)

head(CPS85)

base_model <- lm(wage ~ sector + exper, data = CPS85)
augmented_model <- lm(wage ~ sector + exper + age, data = CPS85)

Training_data <- data.frame(name = c("Nicole", "Anna", "Tom", "Wes"), weight = c(120, 130, 180, 150), sex = c("F", "F", "M", "M"), height = c(163, 166, 179, 183))
Testing_data <- data.frame(name = c("Josi", "Lore", "Jen", "Leo"), weight = c(130, 150, 280, 200), sex = c("M", "F", "F", "M"), height = c(172, 170, 151, 186))

mod_1 <- lm( height ~ sex, data = Training_data)
mod_2 <- lm( height ~ sex + weight, data = Training_data)

preds_1 <- predict(mod_1, newdata = Testing_data)
preds_2 <- predict(mod_2, newdata = Testing_data)

errors_1 <- Testing$height - preds_1
errors_2 <- Testing$height - preds_2

mse_1 <- mean( errors_1 ^ 2 )
mse_2 <- mean( errors_2 ^ 2 )

mse_1
mse_2

################################
# Course
################################

load("DataCamp\\stastical.modeling\\data\\Runners.rda")

Runners_100 <- head(na.omit(Runners), 100)
head(Runners_100)

# Build a model of net running time
base_model <- lm(net ~ age + sex, data = Runners_100)

# Evaluate base_model on the training data
base_model_output <- predict(base_model, newdata = Runners_100)

# Build the augmented model
aug_model <- lm(net ~ age + sex + previous, data = Runners_100)

# Evaluate aug_model on the training data
aug_model_output <- predict(aug_model, newdata = Runners_100)

# How much do the model outputs differ?
mean((base_model_output - aug_model_output) ^ 2, na.rm = TRUE)

# Build and evaluate the base model on Runners_100
base_model <- lm(net ~ age + sex, data = Runners_100)
base_model_output <- predict(base_model, newdata = Runners_100)

# Build and evaluate the augmented model on Runners_100
aug_model <- lm( net ~ age + sex + previous, data = Runners_100)
aug_model_output <- predict(aug_model, newdata = Runners_100)

# Find the case-by-case differences
base_model_differences <- with(Runners_100, net - base_model_output)
aug_model_differences <- with(Runners_100, net - aug_model_output)

# Calculate mean square errors
mean(base_model_differences ^ 2)
mean(aug_model_differences ^ 2)

# Add bogus column to CPS85 (don't change)
CPS85$bogus <- rnorm(nrow(CPS85)) > 0

# Make the base model
base_model <- lm(wage ~ educ + sector + sex, data = CPS85)

# Make the bogus augmented model
aug_model <- lm(wage ~ educ + sector + sex + bogus, data = CPS85)

# Find the MSE of the base model
mean((CPS85$wage - predict(base_model, newdata = CPS85)) ^ 2)

# Find the MSE of the augmented model
mean((CPS85$wage - predict(aug_model, newdata = CPS85)) ^ 2)

# Generate a random TRUE or FALSE for each case in Runners_100
Runners_100$training_cases <- rnorm(nrow(Runners_100)) > 0

# Build base model net ~ age + sex with training cases
base_model <- lm(net ~ age + sex, data = subset(Runners_100, training_cases))

# Evaluate the model for the testing cases
Preds <- evaluate_model(base_model, data = subset(Runners_100, !training_cases))

# Calculate the MSE on the testing data
with(data = Preds, mean((net - model_output) ^ 2))

##############################
# Cross-Validated
##############################

# The model
model <- lm(net ~ age + sex, data = Runners_100)

# Find the in-sample error (using the training data)
in_sample <- evaluate_model(model, data = Runners_100)
in_sample_error <-
  with(in_sample, mean((net - model_output) ^ 2, na.rm = TRUE))

# Calculate MSE for many different trials
trials <- cv_pred_error(model)

# View the cross-validated prediction errors
trials

# Find confidence interval on trials and compare to training_error
mosaic::t.test(~mse, mu = in_sample_error, data = trials)

##############################
# Does the variable help?
##############################

# The base model
base_model <- lm(net ~ age + sex, data = Runners_100)

# An augmented model adding previous as an explanatory variable
aug_model <- lm(net ~ age + sex + previous, data = Runners_100)

# Run cross validation trials on the two models
trials <- cv_pred_error(base_model, aug_model)

# Compare the two sets of cross-validated errors
t.test(mse ~ model, data = trials)