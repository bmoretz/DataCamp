RPROJ <- list(HOME = normalizePath(getwd()), DATA = normalizePath("DataCamp\\credit.risk\\data\\"))

loan.data.file <- paste0(RPROJ$DATA, "loan_data_ch2.rds")
loan_data <- readRDS(loan.data.file)

# Set seed of 567
set.seed(567)

# Store row numbers for training set: index_train
index_train <- sample(1:nrow(loan_data), 2 / 3 * nrow(loan_data))

# Create training set: training_set
training_set <- loan_data[index_train,]

# Build a glm model with variable ir_cat as a predictor
log_model_cat <- glm( loan_status ~ ir_cat, family = "binomial", data = training_set )

# Print the parameter estimates 
print(log_model_cat)

# Look at the different categories in ir_cat using table()
table(loan_data$ir_cat)

log_model_cat$coefficients

# Build the logistic regression model
log_model_multi <- glm(loan_status ~ age + ir_cat + grade + loan_amnt + annual_inc, family = "binomial", data = training_set)

# Obtain significance levels using summary()
summary(log_model_multi)

# Build the logistic regression model
predictions_all_small <- predict(log_model_small, newdata = test_set, type = "response")

# Look at the range of the object "predictions_all_small"
range(predictions_all_small)

# Change the code below to construct a logistic regression model using all available predictors in the data set
log_model_small <- glm(loan_status ~ ., family = "binomial", data = training_set)

# Make PD-predictions for all test set elements using the the full logistic regression model
predictions_all_full <- predict(log_model_small, newdata = test_set, type = "response")

# Look at the predictions range
range(predictions_all_full)

# The code for the logistic regression model and the predictions is given below
log_model_full <- glm(loan_status ~ ., family = "binomial", data = training_set)
predictions_all_full <- predict(log_model_full, newdata = test_set, type = "response")

# Make a binary predictions-vector using a cut-off of 15%
pred_cutoff_15 <- ifelse(predictions_all_full > 0.15, 1, 0)

# Construct a confusion matrix
table(test_set$loan_status, pred_cutoff_15)

# Chapter Wrap-up, probit & cloglog models

# Fit the logit, probit and cloglog-link logistic regression models

log_model_logit <- glm(loan_status ~ age + emp_cat + ir_cat + loan_amnt,
					   family = binomial(link = logit), data = training_set)

log_model_probit <- glm(loan_status ~ age + emp_cat + ir_cat + loan_amnt,
					   family = binomial(link = probit), data = training_set)

log_model_cloglog <- glm(loan_status ~ age + emp_cat + ir_cat + loan_amnt,
					   family = binomial(link = cloglog), data = training_set)

# Make predictions for all models using the test set
predictions_logit <- predict(log_model_logit, newdata = test_set, type = "response")
predictions_probit <- predict(log_model_probit, newdata = test_set, type = "response")
predictions_cloglog <- predict(log_model_cloglog, newdata = test_set, type = "response")

# Use a cut-off of 14% to make binary predictions-vectors
cutoff <- 0.14
class_pred_logit <- ifelse(predictions_logit > cutoff, 1, 0)
class_pred_probit <- ifelse(predictions_probit > cutoff, 1, 0)
class_pred_cloglog <- ifelse(predictions_cloglog > cutoff, 1, 0)

# Make a confusion matrix for the three models
tab_class_logit <- table(true_val, class_pred_logit)
tab_class_probit <- table(true_val, class_pred_probit)
tab_class_cloglog <- table(true_val, class_pred_cloglog)

# Compute the classification accuracy for all three models
acc_logit <- sum(diag(tab_class_logit)) / nrow(test_set)
acc_probit <- sum(diag(tab_class_probit)) / nrow(test_set)
acc_cloglog <- sum(diag(tab_class_cloglog)) / nrow(test_set)
