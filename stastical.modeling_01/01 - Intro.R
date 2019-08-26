library(mosaicData)
library(ggplot2)

# Use data() to load Trucking_jobs

load("DataCamp\\stastical.modeling\\data\\Trucking_jobs.rda")

# View the number rows in Trucking_jobs
nrow(Trucking_jobs)

# Use names() to find variable names in mosaicData::Riders

names(mosaicData::Riders)
# Load ggplot2 package

library(ggplot2)

# Look at the head() of diamonds
head(diamonds)

load("DataCamp\\stastical.modeling\\data\\AARP.rda")

# Find the variable names in AARP
names(AARP)

# Find the mean cost broken down by sex
mosaic::mean(Cost ~ Sex, data = AARP)

# Create a boxplot using base, lattice, or ggplot2
ggplot(aes(x=Sex, y=Cost), data = AARP) + geom_boxplot()


# Make a scatterplot using base, lattice, or ggplot2
ggplot(aes(x = Cost, y = Age), data = AARP) + geom_point()