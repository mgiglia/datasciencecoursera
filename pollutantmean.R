pollutantmean <- function (directory, pollutant, id = 1:332) {
      ## 'directory' is a characater vector of length 1 indicating
      ## the location of the CSV files
      
      ## 'pollutant' is a character vector of length 1 indicating
      ## the name of the pollutant for which we will calculate the
      ## mean: either "sulfate" or "nitrate".
      
      ## 'id' is an integer vector indicating the monitor ID numbers
      ## to be used
      
      ## Return the mean of the pollutant across all monitors listed
      ## in the 'id' vector (ignoring NA values)
      ## NOTE: Do not round the result!
      
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
            
            if (i == 1) {
                  final.set <- temp
            } else {
                  final.set <- rbind(final.set,temp)
            }
            
      }       
      mean(final.set[,pollutant], na.rm=TRUE)
}