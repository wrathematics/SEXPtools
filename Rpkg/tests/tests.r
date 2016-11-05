library(RNACI, quietly=TRUE)

CHECK <- function(test, truth) stopifnot(identical(test, truth))
TESTING <- function(what) cat(paste0(what, ": "))
OK <- function() cat("ok!\n")

a <- 1:4
b <- 123456/(1:4)

cat("Testing RNACI...\n\n")

### vectors
TESTING("Vectors")

CHECK(RNACI_intvec(), a)
CHECK(RNACI_dblvec(), b)

OK()



### Dataframes
TESTING("dataframes")

test <- RNACI_df()
truth <- data.frame(a=a, b=b)
CHECK(test, truth)

test <- RNACI_df_nonames()
colnames(truth) <- NULL
CHECK(test, truth)

test <- RNACI_df_empty()
truth <- data.frame()
CHECK(test, truth)

OK()



### Lists
TESTING("lists")

test <- RNACI_list()
truth <- list(a=a, b=b)
CHECK(test, truth)

test <- RNACI_list_nonames()
names(truth) <- NULL
CHECK(test, truth)

test <- RNACI_list_empty()
truth <- list()
CHECK(test, truth)

OK()



TESTING("misc")

test <- capture.output(invisible(.Call("RNACI_print")))
truth <- capture.output(print(matrix(c(0:2, 1:3), 3, 2)))
CHECK(test, truth)

OK()
