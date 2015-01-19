corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  allID <- 1:332
  completecases <- getcompletecase(directory, allID)
  maps <- formmap(completecases, allID)
  use <- maps$nobs > threshold
  ids <- maps$id[use]
  correlations <- calccor(completecases, ids)
  correlations
  
}

getcompletecase <- function(directory, ids){
  tabledata <- data.frame()
  
  fnames <- list.files(path=directory, pattern = "[0-9]{3}\\.csv", full.names = TRUE)
  for(f in fnames){
    ## data.frame m <- read directory/id_str.csv
    ## data.frame all <- rbind(all,m)
    m <- read.csv(f)
    ## remove NA
    ## subset according to id
    m <- subset(m, !is.na(m$Date) & !is.na(m$sulfate) & !is.na(m$nitrate) & m$ID %in% ids)
    tabledata <- rbind(tabledata, m)
  }
  tabledata
}

formmap <- function(tabledata,id){
  maps <- data.frame()
  
  for(i in id){
    nobs <- nrow(subset(tabledata, tabledata$ID == i))
    maps <- rbind(maps, cbind("id"=i,"nobs"=nobs))
  }
  
  maps
}

calccor <- function(cases, ids){
  corrs <- numeric()
  for(id in ids){
    st <- subset(cases, cases$ID == id)
    corr <- cor(st$sulfate, st$nitrate)
    ##corr <- as.numeric(signif(corr, digits = 4))
    corr <- as.numeric(corr)
    corrs <- append(corrs, corr)
  }
  corrs
}