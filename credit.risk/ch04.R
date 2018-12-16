# Make predictions for the probability of default using the pruned tree and the test set.
prob_default_prior <- predict(ptree_prior, newdata = test_set)[, 2]

# Obtain the cutoff for acceptance rate 80%

cutoff_prior <- quantile(prob_default_prior, .8)

# Obtain the binary predictions.
bin_pred_prior_80 <- ifelse(prob_default_prior > cutoff_prior, 1, 0)

# Obtain the actual default status for the accepted loans
accepted_status_prior_80 <- test_set$loan_status[bin_pred_prior_80 == 0]

# Obtain the bad rate for the accepted loans

sum(accepted_status_prior_80) / length(accepted_status_prior_80)

# Have a look at the function strategy_bank
strategy_bank

# Apply the function strategy_bank to both predictions_cloglog and predictions_loss_matrix
strategy_cloglog <- strategy_bank(predictions_cloglog)
strategy_loss_matrix <- strategy_bank(predictions_loss_matrix)

# Obtain the strategy tables for both prediction-vectors
strategy_cloglog$table
strategy_loss_matrix$table

# Plot the strategy functions
par(mfrow = c(1, 2))
plot(strategy_cloglog$accept_rate, strategy_cloglog$bad_rate,
	 type = "l", xlab = "Acceptance rate", ylab = "Bad rate",
	 lwd = 2, main = "logistic regression")

plot(strategy_loss_matrix$accept_rate, strategy_loss_matrix$bad_rate,
	 type = "l", xlab = "Acceptance rate",
	 ylab = "Bad rate", lwd = 2, main = "tree")

library(pROC)

# Load the pROC-package
library(pROC)

# Construct the objects containing ROC-information
ROC_logit <- roc(test_set$loan_status, predictions_logit)
ROC_probit <- roc(test_set$loan_status, predictions_probit)
ROC_cloglog <- roc(test_set$loan_status, predictions_cloglog)
ROC_all_full <- roc(test_set$loan_status, predictions_all_full)

# Draw all ROCs on one plot
plot(ROC_logit)
lines(ROC_probit, col = "blue")
lines(ROC_cloglog, col = "red")
lines(ROC_all_full, col = "green")

# Compute the AUCs
auc(ROC_logit)
auc(ROC_probit)
auc(ROC_cloglog)
auc(ROC_all_full)

# Construct the objects containing ROC-information
ROC_undersample <- roc(test_set$loan_status, predictions_undersample)
ROC_prior <- roc(test_set$loan_status, predictions_prior)
ROC_loss_matrix <- roc(test_set$loan_status, predictions_loss_matrix)
ROC_weights <- roc(test_set$loan_status, predictions_weights)

# Draw the ROC-curves in one plot
plot(ROC_undersample)
lines(ROC_prior, col = "blue")
lines(ROC_loss_matrix, col = "red")
lines(ROC_weights, col = "green")

# Compute the AUCs
auc(ROC_undersample)
auc(ROC_prior)
auc(ROC_loss_matrix)
auc(ROC_weights)

# Build four models each time deleting one variable in log_3_remove_ir
log_4_remove_amnt <- glm(loan_status ~ grade + annual_inc + emp_cat,
						family = binomial, data = training_set)
log_4_remove_grade <- glm(loan_status ~ loan_amnt + annual_inc + emp_cat,
						family = binomial, data = training_set)
log_4_remove_inc <- glm(loan_status ~ loan_amnt + grade + emp_cat,
						family = binomial, data = training_set)
log_4_remove_emp <- glm(loan_status ~ loan_amnt + grade + annual_inc,
						family = binomial, data = training_set)

# Make PD-predictions for each of the models
pred_4_remove_amnt <- predict(log_4_remove_amnt, newdata = test_set, type = "response")
pred_4_remove_grade <- predict(log_4_remove_grade, newdata = test_set, type = "response")
pred_4_remove_inc <- predict(log_4_remove_inc, newdata = test_set, type = "response")
pred_4_remove_emp <- predict(log_4_remove_emp, newdata = test_set, type = "response")

# Compute the AUCs
auc(test_set$loan_status, pred_4_remove_amnt)
auc(test_set$loan_status, pred_4_remove_grade)
auc(test_set$loan_status, pred_4_remove_inc)
auc(test_set$loan_status, pred_4_remove_emp)

# Build three models each time deleting one variable in log_4_remove_amnt
log_5_remove_grade <- glm(loan_status ~ annual_inc + emp_cat, family = binomial, data = training_set)
log_5_remove_inc <- glm(loan_status ~ grade + emp_cat, family = binomial, data = training_set)
log_5_remove_emp <- glm(loan_status ~ grade + annual_inc, family = binomial, data = training_set)

# Make PD-predictions for each of the models
pred_5_remove_grade <- predict(log_5_remove_grade, newdata = test_set, type = "response")
pred_5_remove_inc <- predict(log_5_remove_inc, newdata = test_set, type = "response")
pred_5_remove_emp <- predict(log_5_remove_emp, newdata = test_set, type = "response")

# Compute the AUCs
auc(test_set$loan_status, pred_5_remove_grade)
auc(test_set$loan_status, pred_5_remove_inc)
auc(test_set$loan_status, pred_5_remove_emp)

# Plot the ROC-curve for the best model here
plot(roc(test_set$loan_status, pred_4_remove_amnt))