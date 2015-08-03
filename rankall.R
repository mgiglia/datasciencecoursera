rankall <- function (outcome, num = "best") {
      ## Read outcome data
      
      outcome.set <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
      states <- unique(outcome.set$State)
      outcome.state <- outcome.set[complete.cases(outcome.set),]
      
      ## Check that outcome is valid
      
      if (outcome == "heart attack") {
            outcome.state[, 11] <- suppressWarnings(as.numeric(outcome.state[, 11]))
            result.set <- outcome.state[,c(2,7,11)]
      } else if (outcome == "heart failure") {
            outcome.state[, 17] <- suppressWarnings(as.numeric(outcome.state[,17]))
            result.set <- outcome.state[,c(2,7,17)]
      } else if (outcome == "pneumonia") {
            outcome.state[, 23] <- suppressWarnings(as.numeric(outcome.state[,23]))
            result.set <- outcome.state[,c(2,7,23)]
      } else {
            stop("invalid outcome", call. = TRUE)
      }
      
      ## For each state, find the hospital of the given rank
      
      for (i in 1:length(states)) {
            state.eval <- states[i]
            state.set <- result.set[result.set$State == state.eval,]
            state.set <- state.set[do.call(order, state.set),]
            state.set2 <- data.frame(state.set, rank = rank(state.set[,3], na.last = TRUE, ties.method = c("first")))
            
            if (num == "best") {
                  temp <- state.set2[state.set2$rank == 1,c(1,2)]
            } else if (num == "worst") {
                  temp <- state.set2[state.set2$rank == nrow(state.set2),c(1,2)]
            } else if (num > nrow(state.set2)) {
                  temp <- data.frame(Hospital.Name = "NA", State = state.eval)
            } else {
                  temp <- state.set2[state.set2$rank == num,c(1,2)]
            }
            
            if (i == 1) {
                  final.set <- temp
            } else {
                  final.set <- rbind(final.set,temp)
            }
            
      }
       
      ## Return a data frame with the hospital names and the
      ## (abbreviated) state name
      names(final.set)[1] <- "hospital"
      names(final.set)[2] <- "state"
      final.set <- final.set[order(final.set$state),]
      final.set
}