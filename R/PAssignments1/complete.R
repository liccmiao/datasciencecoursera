complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  tabledata <- data.frame()
  
  fnames <- list.files(path=directory, pattern = "[0-9]{3}\\.csv", full.names = TRUE)
  for(f in fnames){
    ## data.frame m <- read directory/id_str.csv
    ## data.frame all <- rbind(all,m)
    m <- read.csv(f)
    ## remove NA
    ## subset according to id
    m <- subset(m, !is.na(m$Date) & !is.na(m$sulfate) & !is.na(m$nitrate) & m$ID %in% id)
    tabledata <- rbind(tabledata, m)
  }
  retdata <- data.frame()
  
  for(i in id){
    nobs <- nrow(subset(tabledata, tabledata$ID == i))
    retdata <- rbind(retdata, cbind("id"=i,"nobs"=nobs))
  }
  
  retdata
}