library(rpart)
library(rpart.plot)
library(statisticalModeling)

library(NHANES)
library(dplyr)

###########################################################
# Maximum Error Rate
###########################################################

load("DataCamp\\stastical.modeling\\data\\Runners.rda")

####### null model


# Build the null model with rpart()
Runners$all_the_same <- 1 # null "explanatory" variable
null_model <- rpart(start_position ~ all_the_same, data = Runners)

# Evaluate the null model on training data
null_model_output <- evaluate_model(null_model, data = Runners, type = "class")

# Calculate the error rate
with(data = null_model_output, mean(Runners$start_position != null_model_output$model_output, na.rm = TRUE))

# Generate a random guess...
null_model_output$random_guess <- mosaic::shuffle(Runners$start_position)

# ...and find the error rate
with(data = null_model_output, mean(Runners$start_position != random_guess, na.rm = TRUE))

####### non-null model

# Train the model
model <- rpart(start_position ~ age + sex, data = Runners, cp = 0.001)

# Get model output with the training data as input
model_output <- evaluate_model(model, data = Runners, type = "class")

# Find the error rate
with(data = model_output, mean(start_position != model_output, na.rm = TRUE))

####### Cross-Validation

sample <- sample(nrow(Runners), 90)

Training_data <- Runners[sample,]
Training_data$all_the_same <- 1
Training_data$traing_case <- TRUE

Testing_data <- Runners[-sample,]
Testing_data$all_the_same <- 1
Testing_data$traing_case <- FALSE

# Train the models 
null_model <- rpart(start_position ~ all_the_same,
					data = Training_data, cp = 0.001)

model_1 <- rpart(start_position ~ age,
				 data = Training_data, cp = 0.001)

model_2 <- rpart(start_position ~ age + sex,
				 data = Training_data, cp = 0.001)

# Find the out-of-sample error rate
null_output <- evaluate_model(null_model, data = Testing_data, type = "class")
model_1_output <- evaluate_model( model_1, data = Testing_data, type = "class")
model_2_output <- evaluate_model( model_2, data = Testing_data, type = "class")

# Calculate the error rates
null_rate <- with(data = null_output,
				  mean(start_position != model_output, na.rm = TRUE))

model_1_rate <- with(data = model_1_output,
		mean(start_position != model_output, na.rm = TRUE))

model_2_rate <- with(data = model_2_output,
		mean(start_position != model_output, na.rm = TRUE))

# Display the error rates
null_rate
model_1_rate
model_2_rate

###########################################################
# Maximum Error Rate
###########################################################

# Example, Factors in health and disease

# Question: What factors causes people to smoke?

names(NHANES) %>% head(20)

NHANES %>%
	select(SmokeNow, Poverty, MaritalStatus, Gender, BMI, TotChol, AgeFirstMarij, SmokeNow)

# simple
model <- rpart(SmokeNow ~ Poverty + MaritalStatus + Gender + BMI + TotChol + AgeFirstMarij, data = NHANES)

prp(model, type = 4, extra = 105, varlen = 0)

# complex
model <- rpart(SmokeNow ~ Poverty + MaritalStatus + Gender + BMI + TotChol + AgeFirstMarij, data = NHANES, cp = 0.002)

prp(model, type = 4, extra = 105, varlen = 0)

# Runners
model <- rpart(net ~ sex + age, data = Runners, cp = 0.001)
prp(model, type = 3)