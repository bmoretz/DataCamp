library(data.table)
library(statisticalModeling)
library(mosaicData)

attach(CPS85)

colsNames <- c("price", "lot_size", "waterfront", "age", "land_value", "construction", "air_cond", "fuel", "heat", "sewer", "living_area", "pct_college", "bedrooms", "fireplaces", "bathrooms", "rooms")

Houses_for_sale <- read.csv("DataCamp\\stastical.modeling\\data\\HousesForSale.csv" )
names(Houses_for_sale) <- colsNames

# Train the model price ~ fireplaces
simple_model <- lm(price ~ fireplaces, data = Houses_for_sale)

# Evaluate simple_model
evaluate_model(simple_model)

# Calculate the difference in model price
naive_worth <- 238522.7 - 171823.9

# Train another model including living_area
sophisticated_model <- lm(price ~ fireplaces + living_area, data = Houses_for_sale)

# Evaluate that model
evaluate_model(sophisticated_model)

# Find price difference for fixed living_area
sophisticated_worth <- 242319.5 - 233357.1

# Train model_1 and model_2
model_1 <- lm(R ~ X, data = Crime)
model_2 <- lm(R ~ W, data = Crime)

# Evaluate each model...
evaluate_model(model_1)
evaluate_model(model_2)

# ...and calculate the difference in output for each
change_with_X <- 106.82223 - 89.46721
change_with_W <- 68.32909 - 103.70777

# Train model_3 using both X and W as explanatory variables
model_3 <- lm(R ~ X + W, data = Crime)

# Evaluate model_3
evaluate_model(model_3)

# Find the difference in output for each of X and W
change_with_X_holding_W_constant <- 228.50366 - 134.86434
change_with_W_holding_X_constant <- 134.86434 - 31.03422

# Train the five models
model_1 <- lm(earnings ~ sex, data = Trucking_jobs)
model_2 <- lm(earnings ~ sex + age, data = Trucking_jobs)
model_3 <- lm(earnings ~ sex + hiredyears, data = Trucking_jobs)
model_4 <- lm(earnings ~ sex + title, data = Trucking_jobs)
model_5 <- lm(earnings ~ sex + age + hiredyears + title, data = Trucking_jobs)

# Evaluate each model...
evaluate_model(model_1)
evaluate_model(model_2, age = 37.34109)
evaluate_model(model_3, hiredyears = 5)
evaluate_model(model_4, title = "PROGRAMMER")
evaluate_model(model_5, age = 37.34109, hiredyears = 5,
			   title = "PROGRAMMER")

# ...and calculate the gender difference in earnings 
diff_1 <- 40236.35 - 35501.25
diff_2 <- 39498.13 - 37143.80
diff_3 <- 39996.93 - 36366.89
diff_4 <- 41616.92 - 41949.25
diff_5 <- 41497.60 - 41512.88

# Calculating Effect Size
head(CPS85)

wage_model <- lm(wage ~ sex + exper + sector + educ, data = CPS85)

evaluate_model(wage_model, educ = 11:12, sector = "prof", sex = "F", exper = 10)

attach(AARP)

# example

insurance_model <- lm(Cost ~ Age + Sex + Coverage, data = AARP)

evaluate_model(insurance_model)

age_effect <- effect_size(insurance_model, ~ Age)
sex_effect <- effect_size(insurance_model, ~ Sex)

age_effect$slope * 12 / sex_effect$change

effect_size(insurance_model, ~ Coverage)

# Calculating the GPA 
gpa_mod_1 <- lm(gradepoint ~ sid, data = College_grades)

# The GPA for two students
evaluate_model(gpa_mod_1, sid = c("S32115", "S32262"))

# Use effect_size()
effect_size(gpa_mod_1, ~ sid)

# Specify from and to levels to compare
effect_size(gpa_mod_1, ~ sid, sid = "S32115", to = "S32262")

# A better model?
gpa_mod_2 <- lm(gradepoint ~ sid + dept + level, data = College_grades)

# Find difference between the same two students as before
effect_size(gpa_mod_2, ~ sid, sid = "S32115", to = "S32262")