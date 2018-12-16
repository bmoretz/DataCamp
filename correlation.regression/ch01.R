library(ggplot2)
library(openintro)

"Scatterplots are the most common and effective tools for visualizing the relationship between two numeric variables.

The ncbirths dataset is a random sample of 1,000 cases taken from a larger dataset collected in 2004. 
Each case describes the birth of a single child born in North Carolina, along with various characteristics of the child (e.g. birth weight, length of gestation, etc.), 
the child's mother (e.g. age, weight gained during pregnancy, smoking habits, etc.) and the child's father (e.g. age)."

# Scatterplot of weight vs. weeks
ggplot(data = ncbirths, aes(x = weeks, y = weight)) + geom_point()

# Boxplot of weight vs. weeks
ggplot(data = ncbirths,
	   aes(x = cut(weeks, breaks = 5), y = weight)) +
  geom_boxplot()

# Mammals scatterplot

# Using the mammals dataset, create a scatterplot illustrating how the brain weight of a mammal varies as a function of its body weight.
ggplot(data = mammals, aes(x = BodyWt, y = BrainWt)) +
  geom_point()

# Baseball player scatterplot

# Using the mlbBat10 dataset, create a scatterplot illustrating how the slugging percentage (SLG) of a player varies as a function of his on-base percentage (OBP).

ggplot(data = mlbBat10, aes(x = OBP, y = SLG)) + geom_point()

# Body dimensions scatterplot

# Using the bdims dataset, create a scatterplot illustrating how a person's weight varies as a function of their height. 
# Use color to separate by sex, which you'll need to coerce to a factor with factor().

ggplot(data = bdims, aes(x = hgt, y = wgt, color = factor(sex))) + geom_point()

# Smoking scatterplot

# Using the smoking dataset, create a scatterplot illustrating how the amount that a person smokes on weekdays varies as a function of their age.

ggplot(data = smoking, aes(x = age, y = amtWeekdays)) + geom_point()

# Scatterplot with coord_trans()
ggplot(data = mammals, aes(x = BodyWt, y = BrainWt)) +
  geom_point() +
  coord_trans(x = "log10", y = "log10")

# Scatterplot with scale_x_log10() and scale_y_log10()
ggplot(data = mammals, aes(x = BodyWt, y = BrainWt)) +
  geom_point() +
  scale_x_log10() + scale_y_log10()

# Scatterplot of SLG vs. OBP
mlbBat10 %>%
  filter(AB >= 200) %>%
  ggplot(aes(x = OBP, y = SLG)) +
  geom_point()

# Identify the outlying player
mlbBat10 %>%
  filter(AB >= 200, OBP <= .2)