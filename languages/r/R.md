
# R

[r-project.org](https://www.r-project.org)
[Books related to R - r-project.org](https://www.r-project.org/doc/bib/R-books.html)


## Solving a System of Equations

It takes Alice and Bob 2 hours to complete a task, Alice and Charlie can complete the task 3 hours, Bob and Charlie complete the task in 4
hours. How long will it take to complete the task if all 3, (Alice, Bob, and Charlie), all work together.

```R
> A <- matrix( c(2,2,0,3,0,3,0,4,4), 3,3, byrow=TRUE)
> b <- matrix( c(1,1,1), 3,1)
> z <- solve( A,b )
> A
     [,1] [,2] [,3]
[1,]    2    2    0
[2,]    3    0    3
[3,]    0    4    4
> b
     [,1]
[1,]    1
[2,]    1
[3,]    1
> z
           [,1]
[1,] 0.29166667
[2,] 0.20833333
[3,] 0.04166667
> answer <- 60 * (1/sum(z))
> answer
[1] 110.7692
```


