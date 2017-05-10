library(lpSolveAPI)
lprec <- make.lp(0, 2)
#Defaults to Minimize objective function
set.objfn(lprec, c(-15, -20))
add.constraint(lprec, c(.5, 1), "<=", 10)
add.constraint(lprec, c(1, 1), "<=", 15)
RowNames <- c("Hours", "Materials")
ColNames <- c("Earrings", "Necklaces")
dimnames(lprec) <- list(RowNames, ColNames)
lprec
solve(lprec)
get.objective(lprec) * -1
get.variables(lprec)
get.constraints(lprec)

rm(lprec)
#Defaults to Maximize objective function
x <- read.lp("problem.lp")
solve(x)
get.objective(x)