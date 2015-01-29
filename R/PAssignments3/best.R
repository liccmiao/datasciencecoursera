best <- function(state, outcome){
  ## Read outcome data
  outcome.data <- read.csv("outcome-of-care-measures.csv", na.strings = "Not Available", stringsAsFactors=FALSE)
  
  ## Check that state and outcome are valid
  ## check state to be the 2-character abbreviated name of a state
  if(!(state %in% outcome.data$State)){
    stop("invalid state")
  }
  
  ## check outcome to be one of the “heart attack”, “heart failure”, or “pneumonia”.
  outcomeColIdx <- numeric(0)
  if(outcome == "heart attack"){
    outcomeColIdx <- 11
  }else if(outcome == "heart failure"){
    outcomeColIdx <- 17
  }else if(outcome == "pneumonia"){
    outcomeColIdx <- 23
  }else{
    stop("invalid outcome")
  }
   
  ## Return hospital name in that state with lowest 30-day death rate
  
  suboutcomedata <- subset(outcome.data, state == outcome.data$State & !is.na(outcome.data[,outcomeColIdx]))
  min.outcome <- min(suboutcomedata[,outcomeColIdx])
  h.name <- as.vector(subset(suboutcomedata, suboutcomedata[,outcomeColIdx] == min.outcome, "Hospital.Name")$Hospital.Name)
  h.name <- sort(h.name)
  h.name[1]
  
}