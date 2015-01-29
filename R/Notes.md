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



Written with [StackEdit](https://stackedit.io/).
