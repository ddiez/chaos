#' logistic_map
#'
#' Create a logistic map with parameters.
#'
#' @param rmin min r.
#' @param rmax max r.
#' @param rstep r step.
#' @param n number of iterations.
#' @param x0 initial value.
#'
#' @return logmap object.
#' @export
#'
logistic_map <- function(rmin = 0, rmax = 4, rstep = .1, n = 1000, x0 = runif(1,0,1)) {
  res <- lapply(seq(rmin, rmax, rstep), function(r) {
    tail(data.frame(r = r, grow = comp_grow(
      r = r, x0 = x0, n = n
    )), 100)
  })
  res <- bind_rows(res)
  res <- res[!duplicated(res), ]
  class(res) <- "logmap"
  res
}


#' comp_grow
#'
#' @details
#' x(n+1) = r*x(n)*(1-x(n))
#' @param r grow rate
#' @param n number of generations
#'
comp_grow = function(r, x0 = .1, n = 100) {
  # initialize initial generation.
  res=rep(NA_real_, n)
  x_prev=x0
  res[1]=x0
  # compute n generations.
  for(k in 2:n) {
    x_new = r * x_prev * (1 - x_prev)
    x_prev = x_new
    res[k]=x_new
  }
  res
}