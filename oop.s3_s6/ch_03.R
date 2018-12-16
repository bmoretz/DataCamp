library(R6)
library(assertive)

# *********************
# Basic R6 Objects
# *********************

# Define microwave_oven_factory
microwave_oven_factory <- R6Class(
	"MicrowaveOven",
	private = list(
		power_rating_watts = 800,
		door_is_open = FALSE
	),
	public = list(
		cook = function(time_seconds) {
			Sys.sleep(time_seconds)
			print("Your food is cooked!")
		},
		open_door = function() {
			private$door_is_open = TRUE
		},
		close_door = function() {
			private$door_is_open = FALSE
		},
		initialize = function(power_rating_watts, door_is_open) {

			if (!missing(power_rating_watts)) {
				private$power_rating_watts <- power_rating_watts
			}

			if (!missing(door_is_open)) {
				private$door_is_open <- door_is_open
			}
		}
	)
)

# Make a microwave
a_microwave_oven <- microwave_oven_factory$new(650, TRUE)

# View the microwave_oven_factory
microwave_oven_factory

# Make a new microwave oven
microwave_oven <- microwave_oven_factory$new()

# Call cook method for 1 second
microwave_oven$cook(1)

# *********************
# Active Bindings
# *********************

# Add a binding for power level
microwave_oven_factory <- R6Class(
  "MicrowaveOven",
  private = list(
	..power_rating_watts = 800,
	..power_level_watts = 800
  ),
  active = list(
	  power_level_watts = function(value) {

		if (missing(value)) {
			private$..power_level_watts
		} else {
			assert_is_numeric(value)
			assert_all_are_in_closed_range(value, 0, private$..power_level_watts)

			private$..power_level_watts <- value
		}
	  }
  )
)

# Make a microwave 
a_microwave_oven <- microwave_oven_factory$new()

# Get the power level
a_microwave_oven$power_level_watts

# Try to set the power level to "400"
a_microwave_oven$power_level_watts <- "400"

# Try to set the power level to 1600 watts
a_microwave_oven$power_level_watts <- 1000

# Set the power level to 400 watts
a_microwave_oven$power_level_watts <- 400
