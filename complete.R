## Author: Anupama 
## Date: 19-Jul 2015

## Details about the function 
## Function named 'complete.R' that reads a directory full of files 
## and reports the number of completely observed cases in each data file. 
## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'id' is an integer vector indicating the monitor ID numbers
## to be used
        
## Return a data frame of the form:
## id nobs
## 1  117
## 2  1041
## ...
## where 'id' is the monitor ID number and 'nobs' is the
## number of complete cases

complete <- function(directory, id ){
	## initialize variables here
	existingDF <- NULL
  newrow <- NULL
  i <- 1
 	count <- length(id)

	## loop through elements of monitor id array
	while(i<=count){
		    j<-id[i]

    		## Reading data from the appropriate files in the the directory
    		csvfile <- sprintf("%03d.csv",j)
    		filepath <- file.path(directory, csvfile)
    		readcsvfile <- read.csv(filepath, header = TRUE)
    		
    		## Copying data into a specific dataframe and omitting the rows with null/NA values
    		d <- as.data.frame(readcsvfile)
   	  	m <- na.omit(d)
		    len <- nrow(m)

   		  ## Formatting and copying the values to final dataframe "existingDF" that will store all values.
   		  newrow <- data.frame(id[i], len)
		    colnames(newrow) <- c("id", "nobs")
   	    existingDF <- rbind(existingDF,newrow)
		
		    ## increment value for i and j
		    j <- j + 1
		    i <- i + 1
	}
	
	##Print final output
	colnames(existingDF) <- c("id", "nobs")
	print(existingDF )
	## Note both newrow and existingDF should have the same column names, else rbind function does not work.
	
}
