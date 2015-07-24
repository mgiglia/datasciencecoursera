complete <- function (directory, id = 1:332) {
      ## 'directory' is a character vector of length 1 indicating
      ## the location of the CSV files
      
      ## 'id' is an integer vector indicating the monitor ID numbers
      ## to be used
      
      ## Return a data dram of the form:
      ## id nobs
      ## 1  117
      ## 2  1041
      ## ...
      ## where 'id' is the monitor ID number and 'nobs' is the
      ## number of complete cases
      
      id.ref <- data.frame(id, file.name = vector(mode = 'character', length = length(id)), stringsAsFactors = FALSE)
      for (i in 1:length(id)) {
            
            if (id.ref$id[i] < 10) {
                  id.ref$file.name[i] <- paste('00',id.ref$id[i], sep = "", collapse = NULL)
            } else if  (id.ref$id[i] < 100) {
                  id.ref$file.name[i] <- paste('0',id.ref$id[i], sep = "", collapse = NULL)
            } else {
                  id.ref$file.name[i] <- as.character(id.ref$id[i])
            }
            
            temp <- read.csv(file = paste(directory,"/",id.ref$file.name[i],".csv", sep="", collaspe = NULL), colClasses = list("Date","numeric","numeric","integer"))

            temp <- temp[complete.cases(temp),]
            
            if (i == 1) {
                  final.set <- data.frame(id, nobs = vector(mode = 'numeric', length = length(id)), stringsAsFactors = FALSE)
                  final.set$nobs[i] <- nrow(temp)
            } else {
                  final.set$nobs[i] <- nrow(temp)
            }
            
      }
      final.set
}