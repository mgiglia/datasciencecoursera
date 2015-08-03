best <- function (state, outcome) {
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
      
      ## Return hospital name in the state with lowest 30-day death
      ## rate
            best.rate <- min(result.set[,2], na.rm = TRUE)
            best.hospitals <- result.set[result.set[,2] == best.rate,1]
            min(best.hospitals, na.rm = TRUE)
}
