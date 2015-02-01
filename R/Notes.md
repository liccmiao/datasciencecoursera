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



Written with [StackEdit](https://stackedit.io/).
