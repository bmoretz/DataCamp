## Ex.6

# Set the source for CP to FRED
setSymbolLookup(src = "yahoo")

# Set the source for CP to FRED
setSymbolLookup(src = "FRED")

# Look at the first few rows of CP
head(CP)

# Set the source for CP to FRED
setSymbolLookup(src = "FRED")

# Load CP data again
getSymbols("CP")

# Look at the first few rows of CP
head(CP)

## Ex.7

# Save symbol lookup table
saveSymbolLookup(file = "my_symbol_lookup.rda")

# Set default source for CP to "yahoo"
setSymbolLookup(CP = "yahoo")

# Verify the default source is "yahoo"
getSymbolLookup("CP")

# Load symbol lookup table
loadSymbolLookup(file = "my_symbol_lookup.rda")