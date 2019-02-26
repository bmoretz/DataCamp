# Fit an MA(1) to dl_varve.   
sarima(dl_varve, p = 0, d = 0, q = 1)

# Fit an ARMA(1,1) to dl_varve. Improvement?
sarima(dl_varve, p = 1, d = 0, q = 1)
