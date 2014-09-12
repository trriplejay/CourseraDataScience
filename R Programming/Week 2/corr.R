corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  
  completes<- complete(directory)
  
  results <- vector("numeric")
    
  for (index in 1:nrow(completes)){
    
    if(completes[index,2] > threshold){
      id <- completes[index,1]
      
      ##re-access each file that is above threshold, and correlate the data
      mod = paste(directory,"/",formatC(id,width=3,flag="0"),".csv",sep="")

      theFile <- read.csv(mod)
      theFile <- theFile[complete.cases(theFile),]
      theFile <- theFile[c("sulfate", "nitrate")]

      x<-cor(theFile)
      results <- c(results, x[1,2])
      
    }
        
  }
  
  results
}