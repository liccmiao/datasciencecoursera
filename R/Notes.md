Notes on r programming learning 
-----------------------------------------
####names()

> for vector  **a** 
> ``` 
> a <- c(1,2) 
> names(a)  <- c('index_1', 'index_2')
> ```
> then ```a['index_1']``` can be used to access the first element of
> a, which gives direct support of the map data structure

####dim()

> for matrix **m** 
> ```
> m <- matrix(0,3,4)   
> dim(m) <- c(2,3) 
> ```
> ```dim(m)``` can access the dimension of the matrix
> 


####set.seed()
> use ```set.seed()``` to make sure the random generated sequence is reproducible

####subset()
> ```?subset``` gives the **description**:
> Return subsets of vectors, matrices or data frames which meet conditions.

####R profiling
>do not use ```system.time()``` and ```Rprof()```  together
>the use of ```Rprof()```
>```
>Rprof(filename)
>time-consumed_function_call()
>Rprof(NULL)
>summaryRprof(filename)
>```


####paste()
> concatenate strings
> parameter sep and collapse have diff meanings
> when using sep , you get a vector of strings as result
> when using collapse, you get a string (actually a vector of length 1) as result
> e.g
> ```
> paste(1:3, c("x","y","z"), sep = "-")
> "1-x" "2-y" "3-z"
> paste(1:3, c("x","y","z"), collapse = "-")
> "1 x-2 y-3 z"
> ```
> here you can see the default value for **sep** is space " "
> ```
> paste(1:3, c("x","y","z"), sep = '-', collapse = '-')
> "1-x-2-y-3-z"
> ```

####number of NAs
>The trick is to recognize that underneath the surface, R
represents TRUE as the number 1 and FALSE as the number 0.
Therefore, if we take the sum of a bunch of TRUEs and FALSEs, we
get the total number of TRUEs.
>```
>y <- rnorm(1000)
>z <- rep(NA,1000)
>my_data <- sample(c(y,z), 100)
>my_na <- is.na(my_data)
>sum(my_na)
>```

#### subset vector except the 2nd and 10th element
> given ```v <- 1:40```
> ```v[c(2,10)]``` gives the 2nd and 10th element which is 2 and 10
> ```v[c(-2,-10)]``` gives all elements except the 2nd and 10th element

#### dim on a vector gets NULL, using length() on vector

#### & && | || xor()
> '&' and '|' evaluate across a vector
> '&&' and '||' only evaluate the first element of vector
> '&' or '&&' evaluate befor '|' or '||' as well
> xor(a, b) evaluate the exclusive OR of a and b

#### which()
> return the indices of TRUE in a vector given by the logical paramter 
> ```
> >ints <- sample(1:100, 10)
> >ints
> [1] 16 50 56 14 40 49 29 64 32 97
> >which(ints >50)
> [1]  3  8 10
> ```

#### any() all()
> Description : 
> Given a set of logical vectors, is at least one of the values true?
> ```
> >ints <- 1:10
> >any(ints < 0)
> [1] FALSE
> >ints <- rep(1,10)
> >all(ints ==1)
> [1] TRUE
> ```

#### download.file()
> important parameters :
> url
> destfile
> method
> if the url start with http, no need to specify the method
> if the url start with https on windows, no need either
> if the url start with https on Mac, specify method with "curl" would be helpful

#### package xlsx for read/write excel files

> ```
> library(xlsx)
> read.xlsx(filename, sheetIndex = 1, header = TRUE)
> ```
> or you can just read partial EXCEL
> ```
> library(xlsx)
> read.xlsx(filename, sheetIndex = 1, header = TRUE, rowIndex = 1:3, colIndex = 2:4)
> ```
> ```write.xlsx``` can be used to write EXCEL with similar usage

#### readLines and nchar

> ```
> nchar_ithline <- function(fn, lines = c(1,-1)){
> filecontents <- readLines(file(fn))
> nchar(filecontents[lines])
> }
> ```

#### read.fwf for reading fixed width format file(*.for)
> ``` 
> fwf.df <- read.fwf(file = url("http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for"),c(10,9,4,9,4,9,4,9,4), skip = 4)
> ```


#### 
Written with [StackEdit](https://stackedit.io/).
