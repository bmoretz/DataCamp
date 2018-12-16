# Load the DBI package

library(DBI)

# Connect to the MySQL database: con
con <- dbConnect(RMySQL::MySQL(),
				 dbname = "tweater",
				 host = "courses.csrrinzqubik.us-east-1.rds.amazonaws.com",
				 port = 3306,
				 user = "student",
				 password = "datacamp")
con

# Build a vector of table names: tables
tables <- dbListTables(conn = con)

# Display structure of tables

str(tables)

# Import the users table from tweater: users
users <- dbReadTable(conn = con, "users")

# Print users
print(users)

# Get table names
table_names <- dbListTables(con)

# Import all tables
tables <- lapply(table_names, FUN =
	function(tbl) {
		dbReadTable(conn = con, name = tbl)
	})

tables

tables[comment]

elisabeth <- dbGetQuery(conn = con, "SELECT tweat_id FROM comments WHERE user_id = 1")

elisabeth

# Import post column of tweats where date is higher than '2015-09-21': latest

latest <- dbGetQuery(conn = con, "SELECT post FROM tweats WHERE date > '2015-09-21'")

# Print latest
latest

# Create data frame specific
specific <- dbGetQuery( conn = con, "SELECT message FROM comments WHERE tweat_id = 77 AND user_id > 4")

# Print specific
specific

# Create data frame short
short <- dbGetQuery(conn = con, "SELECT id, name FROM users WHERE CHAR_LENGTH( name ) < 5")

# Print short
short

dbGetQuery(conn = con, "SELECT post, message
  FROM tweats INNER JOIN comments on tweats.id = tweat_id
    WHERE tweat_id = 77")

# Send query to the database
res <- dbSendQuery(con, "SELECT * FROM comments WHERE user_id > 4")

dbFetch(res, 2)
dbFetch(res)

dbClearResult(res)

# Create the data frame  long_tweats

long_tweats <-dbGetQuery(conn = con, "SELECT post, date
  FROM tweats WHERE CHAR_LENGTH( post ) > 40")

long_tweats

dbDisconnect(conn = con)