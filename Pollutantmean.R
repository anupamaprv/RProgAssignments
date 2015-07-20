## Author: Anupama 
## Date: 18-Jul 2015

## *************************Problem Statement************************* ##
# Write a function named 'pollutantmean' that calculates the mean of a pollutant 
# (sulfate or nitrate) across a specified list of monitors. 
# The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. 
# Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' 
# particulate matter data from the directory specified in the 'directory' 
# argument and returns the mean of the pollutant across all of the monitors, 
# ignoring any missing values coded as NA.


# Inputs: 'directory'="specdata" ; 'pollutant' ; 'id'. 
# Outputs: mean of the pollutant across all of the monitors, ignoring missing values. 
# Note: use command below to compress answer to three decimal places.
# options(digits = 4)

pollutantmean <- function(directory, pollutant, id = 1:332) {

#Initialize variables here
  filetotals <- 0
  observationnumber <- 0
  
#Loop through the array containing id numbers
  for(i in id) {
    csvfile <- sprintf("%03d.csv", i)
    filepath <- file.path(directory, csvfile)
    readcsvfile <- read.csv(filepath)
    justpollutant <- readcsvfile[[pollutant]]
    purepollutant <- justpollutant[!is.na(justpollutant)]
    observationnumber <- observationnumber + length(purepollutant) 
    sumpollutant <- sum(purepollutant)
    filetotals <- filetotals + sumpollutant
  }
  
#  print(filetotals)
#  print(observationnumber)
  
  #Function returns last statement, so calculate "mean" below:
  mean <- filetotals / observationnumber
  
}
