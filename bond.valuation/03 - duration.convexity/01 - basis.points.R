# Calculate the PV01
abs(bondprc(p = 100, r = 0.10, ttm = 20, y = 0.1001)
  - bondprc(p = 100, r = 0.10, ttm = 20, y = 0.10))

