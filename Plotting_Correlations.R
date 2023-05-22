#-------------------------------------------
# Script Name: Plotting_Correlations.R
# Created on: 2023-05-22
# Author: Michelle Lawson
# Email: mlawsy525@gmail.com
# Script generates plots to show correlations between MBTI types and birthdates.
#-------------------------------------------

##  Helper Functions

TwoDigitMonth <- function(x) {
  if(substr(x,2,2) == '/'){
    return(substr(x,1,1))
  } else {
    return(substr(x, 1,2))
  }
}


### Setting Up  Data

## Loading Data
MBTI_data <- read.csv('MBTI_Types_Birthdays.csv')

## Formatting Data
# Adding Birth Years
birthdays <- MBTI_data$Birthday
birth_years <- lapply(birthdays, function(x) substr(x, nchar(x) - 3, nchar(x)))
MBTI_data$Birthyear <- as.integer(birth_years)
# Adding Birth Months
birth_months <- lapply(birthdays, function(x) TwoDigitMonth(x))

# Convert month numbers to month names
birth_months <- lapply(birth_months, function(x) {
  month.name[as.numeric(x)]
})


