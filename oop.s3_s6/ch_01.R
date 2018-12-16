(int_mat <- matrix(1:12, 3))

class(int_mat)
typeof(int_mat)

(num_mat <- matrix(rnorm(12), 3))

class(num_mat)

typeof(num_mat)

mode(num_mat)
storage.mode(num_mat)

type_info <- function(x) {
	c(
	class = class(x),
	typeof = typeof(x),
	mode = mode(x),
	storage.mode = storage.mode(x)
  )
}

# Look at the definition of type_info()
type_info

# Create list of example variables
some_vars <- list(
  an_integer_vector = rpois(24, lambda = 5),
  a_numeric_vector = rbeta(24, shape1 = 1, shape2 = 1),
  an_integer_array = array(rbinom(24, size = 8, prob = 0.5), dim = c(2, 3, 4)),
  a_numeric_array = array(rweibull(24, shape = 1, scale = 1), dim = c(2, 3, 4)),
  a_data_frame = data.frame(int = rgeom(24, prob = 0.5), num = runif(24)),
  a_factor = factor(month.abb),
  a_formula = y ~ x,
  a_closure_function = mean,
  a_builtin_function = length,
  a_special_function = `if`
)

# Loop over some_vars calling type_info() on each element to explore them
lapply(some_vars, type_info)

(x <- rexp(10))

class(x) <- "random_numbers"

x

typeof(x)

is.numeric(x)

length(x)

mean(x)

