#' logmap
#'
#' @param r0 initial value for the r parameter.
#' @param r1 final value for the r parameter.
#' @param length.out increment value for the r parameter.
#' @param maxit maximum number of iterations returned per r value.
#' @export
logmap <- function(r0 = 0, r1 = 4, length.out = 1000, maxit = 100) {
  r <- seq(r0, r1, length.out = length.out)
  y <- sapply(r, iter_logmap_c, maxit = maxit)
  y <- tibble(r = rep(r, times = sapply(y, length)), y = unlist(y))
  class(y) <- "logmap"
  y
}
