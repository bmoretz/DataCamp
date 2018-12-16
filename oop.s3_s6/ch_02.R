library(pryr)

summary(c(TRUE, FALSE, NA, TRUE))

summary(rgamma(1000, 1))

print.function

print.Date

is_s3_generic("t") # generic transpose function	
is_s3_method("t.data.frame") # transpose method for data.frames
is_s3_method("t.test") # a function for Student's t-tests 

# Create get_n_elements
get_n_elements <- function(x, ...) { UseMethod("get_n_elements") }

# Create a data.frame method for get_n_elements
get_n_elements.data.frame <- function(x, ...) { nrow(x) * ncol(x) }

df <- data.frame(C1 = rnorm(10), C2 = rnorm(20))

get_n_elements(df)

# error, no generic defined
get_n_elements(matrix(rnorm(12), 3))

ls.str()

t <- list(rnorm(10))

length

# View pre-defined objects
ls.str()

# Create a default method for get_n_elements

get_n_elements.default <- function(x, ...) { length(unlist(x)) }

# Call the method on the ability.cov dataset
n_elements_ability.cov <- get_n_elements(ability.cov)

methods(class = "glm")

.S3methods(class = "glm")
.S4methods(class = "glm")

length(methods(class = "data.frame"))
length(methods(class = "lm"))
length(methods(class = "factor"))
length(methods(class = "POSIXct"))

exp
sin

.S3PrimitiveGenerics

all_of_time <- c("1970-01-01", "2012-12-21")
as.Date(all_of_time)

class(all_of_time) <- "date_strings"

as.Date(all_of_time)

length(all_of_time)

x <- c(1, 3, 6, 10, 15)

class(x) <- c("triangular_numbers", "natural_numbers", "numeric")

# Inspect your workspace
ls.str()

# cat method
what_am_i.cat <- function(x, ...) {
	# Write a message
	message("I'm a cat")
	# Call NextMethod
	NextMethod()
}

# mammal method
what_am_i.mammal <- function(x, ...) {
	# Write a message
	message("I'm a mammal")
	# Call NextMethod
	NextMethod()
}

# character method
what_am_i.character <- function(x, ...) {
	# Write a message
	message("I'm a character")
	# Call NextMethod
}

# Call what_am_i()
what_am_i(kitty)