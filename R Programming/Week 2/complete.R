complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  mod = paste(directory,"/",formatC(id,width=3,flag="0"),".csv",sep="")
  
  
  ##sample:
  # complete("specdata", 1:2)
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  idIndexer <- 1
  results <- data.frame()
  
  
  for (file in mod){
    
    x<- read.csv(file)
    x<- x[complete.cases(x),]
    theRow <- c(id[idIndexer], nrow(x))
    results <- rbind(results, theRow)
    idIndexer <- idIndexer + 1
    
  }
  
  names(results) <- c("id","nobs")
  
  results
  
}