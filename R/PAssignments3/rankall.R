rankall <- function(outcome, num = "best"){
  ## Read outcome data
  outcome.data <- read.csv("outcome-of-care-measures.csv", na.strings = "Not Available", stringsAsFactors=FALSE)
  
  ## Check that outcome are valid
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
  
  ## For each state, find the hospital of the given rank
  suboutcomedata <- subset(outcome.data, !is.na(outcome.data$State) & !is.na(outcome.data[,outcomeColIdx]))
  outcomeColLists <- split(suboutcomedata,suboutcomedata$State)
  allranks <- data.frame()
  for(n in names(outcomeColLists)){
    rankIdx <- order(outcomeColLists[[n]][,outcomeColIdx],outcomeColLists[[n]]$Hospital.Name)
    h.name <- outcomeColLists[[n]]$Hospital.Name[rankIdx]
    h.namebynum <- getbynum(h.name,num)
    allranks <- rbind(allranks,cbind("hospital" = h.namebynum,"state" = n))
  }
  allranks

  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  
}

getbynum <- function(data, num){
  if(num == "best"){
    return(data[1])
  }
  
  if(num == "worst"){
    return(data[length(data)])
  }
  
  if(typeof(num) == "character"){
    return(NA)
  }
  
  if(num > length(data) | num <1){
    return(NA)
  }
  data[num]
}