library(rpart)
library(mosaicData)
library(ggplot2)
library(statisticalModeling)
library(MASS)

attach(CPS85)

ggplotRegression <- function(fit) {

	require(ggplot2)

	ggplot(fit$model, aes_string(x = names(fit$model)[2], y = names(fit$model)[1])) +
    geom_point() +
    stat_smooth(method = "lm", col = "red") +
    labs(title = paste("Adj R2 = ", signif(summary(fit)$adj.r.squared, 5),
					 "Intercept =", signif(fit$coef[[1]], 5),
					 " Slope =", signif(fit$coef[[2]], 5),
					 " P =", signif(summary(fit)$coef[2, 4], 5)))
}

# Working

head(CPS85)

model_1 <- lm(wage ~ educ + exper, data = CPS85)

ggplotRegression(model_1)

model_2 <- rpart( wage ~ educ + exper, data = CPS85)

ggplotRegression(model_2)

new_input <- data.frame(educ = 10:14, exper = 5)
new_input

lm_result <- predict(model_1, newdata = new_input)
plot(lm_result, type="l")

prediction_1 <- predict(model_1, newdata = CPS85 )
output_1 <- CPS85$wage - prediction_1
head(output_1)

plot(output_1)

rpart_result <- predict(model_2, newdata = new_input)
plot(rpart_result, type="l")

prediction_2 <- predict(model_2, newdata = CPS85)
output_2 <- CPS85$wage - prediction_2
head(output_2)

plot(output_2)

par(mfrow = c(2, 1))
plot(output_1)
plot(output_2)

###########################################################
# Runners
###########################################################

load("DataCamp\\stastical.modeling\\data\\Runners.rda")

# Find the variable names in Runners 
names(Runners)

# Build models: handicap_model_1, handicap_model_2, handicap_model_3 
handicap_model_1 <- lm(net ~ age, data = Runners)
handicap_model_2 <- lm(net ~ sex, data = Runners)
handicap_model_3 <- lm(net ~ age + sex, data = Runners)

# For now, here's a way to visualize the models
fmodel(handicap_model_1)
fmodel(handicap_model_2)
fmodel(handicap_model_3)

# Build rpart model: model_2
model_2 <- rpart(net ~ age + sex, cp = 0.002, data = Runners)

# Examine graph of model_2 (don't change)
fmodel(model_2, ~ age + sex)

# Create run_again_model
run_again_model <- rpart(runs_again ~ age + sex + net, cp = 0.005, data = Ran_twice)

# Visualize the model (don't change)
fmodel(run_again_model, ~ age + net, data = Ran_twice)

###########################################################
# AARP
###########################################################

load("DataCamp\\stastical.modeling\\data\\AARP.rda")

# Display the variable names in the AARP data frame
names(AARP)

# Build a model: insurance_cost_model
insurance_cost_model <- lm( Cost ~ Age + Sex + Coverage, data = AARP)

# Construct a data frame: example_vals 
example_vals <- data.frame( Age = 60, Sex = "F", Coverage = 200)

# Predict insurance cost using predict()
predict(insurance_cost_model, example_vals)

# Load statisticalModeling
library(statisticalModeling)

# Calculate model output using evaluate_model()
evaluate_model(model = insurance_cost_model, data = example_vals)


# Build a model: insurance_cost_model
insurance_cost_model <- lm(Cost ~ Age + Sex + Coverage, data = AARP)

# Create a data frame: new_inputs_1
new_inputs_1 <- data.frame(Age = c(30, 90), Sex = c("F", "M"),
						   Coverage = c(0,100))

# Use expand.grid(): new_inputs_2
new_inputs_2 <- expand.grid(Age = c(30, 90), Sex = c("F", "M"),
						   Coverage = c(0, 100))

# Use predict() for new_inputs_1 and new_inputs_2
predict(insurance_cost_model, newdata = new_inputs_1)
predict(insurance_cost_model, newdata = new_inputs_2)

# Use evaluate_model() for new_inputs_1 and new_inputs_2
evaluate_model(insurance_cost_model, data = new_inputs_1)
evaluate_model(insurance_cost_model, data = new_inputs_2)

? expand.grid

# Evaluate insurance_cost_model
evaluate_model(insurance_cost_model)

# Use fmodel() to reproduce the graphic
fmodel(insurance_cost_model, ~ Coverage + Age + Sex)

# A new formula to highlight difference in sexes
new_formula <- ~Age + Sex + Coverage

# Make the new plot (don't change)
fmodel(insurance_cost_model, new_formula)