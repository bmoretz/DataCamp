# Build your model
my_model <- rpart(price ~ living_area + bathrooms + pct_college,
                  data = Houses_for_sale)

# Graph the model
fmodel(my_model, ~ living_area + bathrooms + pct_college)

# Build the model
mod <- lm(Pulse ~ Height + BMI + Gender, data = NHANES)

# Confirm by reconstructing the graphic provided
fmodel(mod, ~ Height + BMI + Gender) + ggplot2::ylab("Pulse")

# Find effect size
effect_size(mod, ~ BMI)

# Replot the model
fmodel(mod, ~ Height + BMI + Gender) + ggplot2::ylab("Pulse")

# Train this model of start_position
model_1 <- rpart(start_position ~ age + sex + nruns,
                 data = Runners, cp = 0.001)

# Calculate effect size with respect to sex
effect_size(model_1, ~ sex)

# Calculate effect size with respect to age
effect_size(model_1, ~ age)

# Calculate effect size with respect to nruns
effect_size(model_1, ~ nruns)

# An rpart model
mod1 <- rpart(outcome ~ age + smoker, data = Whickham)

# Logistic regression
mod2 <- glm(outcome == "Alive" ~ age + smoker,
            data = Whickham, family = "binomial")

# Visualize the models with fmodel()
fmodel(mod1, outcome ~ age + smoker)
fmodel(mod2, Alive ~ age + smoker)


# Find the effect size of smoker
effect_size(mod1, ~ smoker)
effect_size(mod2, ~ smoker)

