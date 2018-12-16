library(R6)
library(assertive)

# *********************
# R6 Inheritance
# *********************

# Explore the microwave oven class
microwave_oven_factory

# Define a fancy microwave class inheriting from microwave oven
fancy_microwave_oven_factory <- R6Class(
	"FancyMicrowaveOven",
	inherit = microwave_oven_factory
)

# Explore microwave oven classes
microwave_oven_factory
fancy_microwave_oven_factory

# Instantiate both types of microwave
a_microwave_oven <- microwave_oven_factory$new()
a_fancy_microwave <- fancy_microwave_oven_factory$new()

# Get power rating for each microwave
microwave_power_rating <- a_microwave_oven$power_level_watts
fancy_microwave_power_rating <- a_fancy_microwave$power_level_watts

# Verify that these are the same
identical(microwave_power_rating, fancy_microwave_power_rating)

# Cook with each microwave
a_microwave_oven$cook(1)
a_fancy_microwave$cook(1)

# Explore microwave oven class
microwave_oven_factory

# Extend the class definition
fancy_microwave_oven_factory <- R6Class(
	"FancyMicrowaveOven",
	inherit = microwave_oven_factory,
	public = list(
		cook_baked_potato = function() {
			self$cook(3)
		}
	)
)

# Instantiate a fancy microwave
a_fancy_microwave <- fancy_microwave_oven_factory$new()

# Call the cook_baked_potato() method
a_fancy_microwave$cook_baked_potato()

# Explore microwave oven class
microwave_oven_factory

# Update the class definition
fancy_microwave_oven_factory <- R6Class(
	"FancyMicrowaveOven",
	inherit = microwave_oven_factory,
	public = list(
		cook = function(time_seconds) {
			super$cook(time_seconds)
			message("Enjoy your dinner!")
		}
	)
)

# Instantiate a fancy microwave
a_fancy_microwave <- fancy_microwave_oven_factory$new()

# Call the cook() method
a_fancy_microwave$cook(1)

# *********************
# R6 Inheritance ( Multiple Levels )
# *********************

fancy_microwave_oven_factory

# Expose the parent functionality
fancy_microwave_oven_factory <- R6Class(
	"FancyMicrowaveOven",
	inherit = microwave_oven_factory,
	public = list(
	cook_baked_potato = function() {
		self$cook(3)
	},
	cook = function(time_seconds) {
		super$cook(time_seconds)
		message("Enjoy your dinner!")
	}),
	active = list(
		super_ = function() super
	)
)

ascii_pizza_slice <- "   __\n // \"\"--.._\n||  (_)  _ \"-._\n||    _ (_)    '-.\n||   (_)   __..-'\n \\\\__..--\"\""
# Instantiate a fancy microwave
a_fancy_microwave <- fancy_microwave_oven_factory$new()

# Call the super_ binding
a_fancy_microwave$super_

# Explore other microwaves
microwave_oven_factory
fancy_microwave_oven_factory

# Define a high-end microwave oven class
high_end_microwave_oven_factory <- R6Class(
	"HighEndMicrowaveOven",
	inherit = fancy_microwave_oven_factory,
	public = list(
		cook = function(time_seconds) {
			super$super_$cook(time_seconds)
			message(ascii_pizza_slice)
		}
	)
)

# Instantiate a high-end microwave oven
a_high_end_microwave <- high_end_microwave_oven_factory$new()

# Use it to cook for one second
a_high_end_microwave$cook( 1 )