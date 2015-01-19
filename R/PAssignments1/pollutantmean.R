pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)

  tabledata <- data.frame()
  fnames <- list.files(path=directory, pattern = "[0-9]{3}\\.csv", full.names = TRUE)
  for(f in fnames){
    ## data.frame m <- read directory/id_str.csv
    ## data.frame all <- rbind(all,m)
    m <- read.csv(f)
    ## remove NA
    ## subset according to id
    m <- subset(m, !is.na(m[pollutant]) & m$ID %in% id)
    tabledata <- rbind(tabledata, m)
  }
  ##  mean according to polluntant
  colmean <- colMeans(tabledata[pollutant], na.rm=TRUE,dims=1)
  colmean <- format(colmean,digits = 4)
  mean <- as.numeric(colmean[[pollutant]])
  mean
}

