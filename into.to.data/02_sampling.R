library(openintro)
library(dplyr)

data(state)

us_regions = as.data.frame( cbind(state.name, state.region, stringsAsFactors = FALSE) )
colnames(us_regions) <- c("state", "region")

# Simple random sample: states_srs
states_srs <- us_regions %>%
  sample_n(size = 8)

# Count states by region
states_srs %>%
  group_by(region) %>%
  count()

# Stratified sample
states_str <- us_regions %>%
  group_by(region) %>%
  sample_n(size = 2)

# Count states by region
states_str %>%
  group_by( region ) %>%
  count()