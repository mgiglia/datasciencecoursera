rankhospital <- function(state, outcome, num = "best") {
      ## Read outcome data
      
      outcome.set <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
      
      ## Check that state and outcome are valid
      
      outcome.state <- outcome.set[outcome.set$State == state,]
      if (nrow(outcome.state)<1) {
            stop("invalid state", call. = TRUE)
      }
      if (outcome == "heart attack") {
            outcome.state[, 11] <- suppressWarnings(as.numeric(outcome.state[, 11]))
            result.set <- outcome.state[,c(2,11)]
      } else if (outcome == "heart failure") {
            outcome.state[, 17] <- suppressWarnings(as.numeric(outcome.state[,17]))
            result.set <- outcome.state[,c(2,17)]
      } else if (outcome == "pneumonia") {
            outcome.state[, 23] <- suppressWarnings(as.numeric(outcome.state[,23]))
            result.set <- outcome.state[,c(2,23)]
      } else {
            stop("invalid outcome", call. = TRUE)
      }
      
      ## Return hospital name in that state with the given rank
      ## 30-day death rate
      result.set <- result.set[complete.cases(result.set),]
      result.set <- result.set[do.call(order, result.set),]
      result.set2 <- data.frame(result.set,rank = rank(result.set[,2], na.last = TRUE, ties.method = c("first")))
      if (num == "best") {
            result.set2[result.set2$rank == 1,1]
      } else if (num == "worst") {
            result.set2[result.set2$rank == nrow(result.set2),1]
      } else if (num > nrow(result.set2)) {
            "NA"
      } else {
            result.set2[result.set2$rank == num,1]
      }
}