library(corrplot)

# Create correlation matrix using Pearson method
cor(my_data, method = "pearson")

# Create correlation matrix using Spearman method
cor(my_data, method = "spearman")

# Create scatterplot matrix
pairs(my_data)

# Create upper panel scatterplot matrix
pairs(my_data, lower.panel = NULL)

# Create correlation matrix
corrplot(cor_mat)

# Create correlation matrix with numbers
corrplot(cor_mat, method = "number")

# Create correlation matrix with colors
corrplot(cor_mat, method = "color")

# Create upper triangle correlation matrix
corrplot(cor_mat, method = "number", type = "upper")

# Draw heatmap of cor_mat
corrplot(cor_mat, method = "color")

# Draw upper heatmap
corrplot(cor_mat, method = "color", type = "upper")

# Draw the upper heatmap with hclust
corrplot(cor_mat, method = "color", type = "upper", order = "hclust")

