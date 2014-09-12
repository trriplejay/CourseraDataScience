pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  ## sample:
  # pollutantmean("specdata", "nitrate",23)
  
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  if (pollutant != "sulfate" && pollutant != "nitrate"){
    print("incorrect pollutant specified")
    return ()
  }
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  #combine the range of ints with the directory so that we know how
  #to read the CSV files
  mod = paste(directory,"/",formatC(id,width=3,flag="0"),".csv",sep="")
  
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  ##read in the file
  totalmean <- 0
  allvalues <- numeric()
  
  
  for (files in mod){    
    
    x <- read.csv(files) #x now holds the CSV file
    x <- x[,c(pollutant)]#x is now a vector of only the relevant column
    allvalues <- c(allvalues, x[!is.na(x)]) 
    
  }
  totalmean = mean(allvalues)
  
  totalmean
}
