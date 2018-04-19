#' mandelbrot
#'
#' @param x0 starting point in real axis.
#' @param x1 end point in real axis.
#' @param y0 starting point in imaginary axis.
#' @param y1 end point in imaginary axis.
#' @param steps number of points in range.
#' @param maxit maximum number of iterations.
#' @param tol tolerance.
#' @param mc.cores number of cores for parallel processing.
#'
#' @export
mandelbrot <- function(x0 = -2.5, x1 = 1, y0 = -1.5, y1 = 1.5, steps = 100, maxit = 100, tol = 1e-6, mc.cores = parallel::detectCores()) {
  if (Sys.info()["sysname"] == "windows") mc.cores = 1L

  x <- seq(x0, x1, length.out = steps)
  y <- seq(y0, y1, length.out = steps)
  z <- expand.grid(real = x, imag = y)
  z <- z %>% mutate(z = complex(nrow(z), real, imag))
  z <- z %>% mutate(iter = parallel::mcmapply(iter_mandelbrot_c, z, MoreArgs = list(maxit = maxit, tol = tol), mc.cores = mc.cores))
  z
}