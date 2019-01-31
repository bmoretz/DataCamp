# Check the residuals from the naive forecasts applied to the goog series
goog %>% naive() %>% checkresiduals()

# Do they look like white noise (TRUE or FALSE)
googwn <- TRUE

# Check the residuals from the seasonal naive forecasts applied to the ausbeer series
ausbeer %>% snaive() %>% checkresiduals()

# Do they look like white noise (TRUE or FALSE)
beerwn <- FALSE