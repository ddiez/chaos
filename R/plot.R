#' plot.logmap
#'
#' Plot a logistic map object.
#'
#' @param x logmap object.
#' @param ... ignored.
#' @param size point size.
#' @param color point color.
#' @param xlim limits for x-axis.
#'
#' @return NULL
#' @export
#'
plot.logmap <- function(x, ..., size = 1, color = "black", xlim = c(0, 4)) {
  x <- as.data.frame(unclass(x))
  ggplot(x, aes_string(x = "r", y = "y")) +
    geom_point(shape = ".", size = size, color = color) +
    scale_x_continuous(expand = c(0, 0)) +
    scale_y_continuous(limits = c(0, 1), expand = c(0, 0)) +
    theme(panel.border = element_blank())
}


#' plot_mandelbrot
#'
#' @param x mandelbrot set object.
#' @param theme_void logical; whether to use theme_void (default: TRUE).
#'
#' @export
plot_mandelbrot <- function(x, theme_void = TRUE) {
  p <- ggplot(x, aes(real, imag, fill = iter)) +
    geom_raster() +
    scale_x_continuous(expand = c(0, 0)) +
    scale_y_continuous(expand = c(0, 0)) +
    scale_fill_viridis(guide = "none") +
    coord_fixed()

  if (theme_void)
    p <- p + theme_void()

  p
}