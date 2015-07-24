corr <- function (directory, threshold = 0) {
      ## 'directory' is a character vector of length 1 indicating
      ## the location of the CSV file
      
      ## 'threshold' is a numeric vector of length 1 indicating the
      ## number of completely observed observations (on all
      ## variables) required to compute the correlation between
      ## nitrate and sulfate; the default is 0
      
      ## Return a numeric vector of correlations
      ## Note: Do not round the result!
      
      source("complete.R")
      
      test.set <- complete(directory)
      test.set <- test.set[test.set$nobs >= threshold,]
      
      result <- vector(mode = 'numeric', length = nrow(test.set))
      
      if (nrow(test.set)>0) {
      
            for (i in 1:nrow(test.set)) {
            
           
                  if (test.set$id[i] < 10) {
                        file.name <- paste('00', test.set$id[i], sep = "", collapse = NULL)
                  } else if  (test.set$id[i] < 100) {
                        file.name <- paste('0', test.set$id[i], sep = "", collapse = NULL)
                  } else {
                        file.name <- as.character(test.set$id[i])
                  }
                  
                  temp <- read.csv(file = paste(directory,"/",file.name,".csv", sep="", collaspe = NULL), colClasses = list("Date","numeric","numeric","integer"))
                  
                  temp <- temp[complete.cases(temp),]
                  
                  result[i] <- cor(x=temp$nitrate, y=temp$sulfate)  
            } 
            
      } else {
            result <- NULL
      }
      
      result
}