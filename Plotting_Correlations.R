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


#### Setting Up  Data

### Loading Data
MBTI_data <- read.csv('MBTI_Types_Birthdays.csv')

### Formatting Data
## Adding Birth Years
birthdays <- MBTI_data$Birthday
birth_years <- lapply(birthdays, function(x) substr(x, nchar(x) - 3, nchar(x)))
MBTI_data$Birthyear <- as.integer(birth_years)
## Adding Birth Months
birth_months <- lapply(birthdays, function(x) TwoDigitMonth(x))
birth_months_num <- as.numeric(birth_months)
# Convert month numbers to month names
birth_months <- lapply(birth_months, function(x) {
  month.name[as.numeric(x)]
})
MBTI_data$Birthmonth <- as.character(birth_months)
## Adding MBTI Group (E/I & S/N)
type <- MBTI_data$MBTI.Type
mbti_groups <- lapply(type, function(x) substr(x,1,2))
MBTI_data$MBTI.Group <- as.character(mbti_groups)


#### Plotting Charts

### Age Distribution
hist(MBTI_data$Birthyear, col='pink', main='Distribution of Birth Years') 
# This data set has a lot of applicants born in the year 2000.
# This sample is by no means representative of the US population.
# This could be caused by selection bias based on where the survey was shared.

### Ages for each Type
boxplot(Birthyear ~ MBTI.Type, data=MBTI_data, col =2:17, 
        main="Age Distribution per Type")

### Birth Months for each Type
boxplot(birth_months_num  ~ MBTI_data$MBTI.Type, col =2:17, 
        main="Month  Distribution per Type")



