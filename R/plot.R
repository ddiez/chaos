#' plot.logmap
#'
#' Plot a logistic map object.
#'
#' @param x logmap object.
#' @param size point size.
#' @param color point color.
#' @param theme_void logical; whether to use theme_void (default: TRUE).
#'
#' @return NULL
#' @export
#'
plot_logmap <- function(x, size = 1, color = "black", theme_void = TRUE) {
  x <- as.data.frame(unclass(x))

  p <- ggplot(x, aes_string(x = "r", y = "y")) +
    geom_point(shape = ".", size = size, color = color) +
    scale_x_continuous(expand = c(0, 0)) +
    scale_y_continuous(limits = c(0, 1), expand = c(0, 0)) +
    theme(panel.border = element_blank())

  if (theme_void)
    p <- p + theme_void()

  p
}


#' plot_mandelbrot
#'
#' @param x mandelbrot set object.
#' @param theme_void logical; whether to use theme_void (default: TRUE).
#'
#' @export
plot_mandelbrot <- function(x, theme_void = TRUE) {
  p <- ggplot(x, aes_string("real", "imag", fill = "iter")) +
    geom_raster() +
    scale_x_continuous(expand = c(0, 0)) +
    scale_y_continuous(expand = c(0, 0)) +
    scale_fill_viridis(guide = "none") +
    coord_fixed()

  if (theme_void)
    p <- p + theme_void()

  p
}