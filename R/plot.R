#' plot.logmap
#'
#' Plot a logistic map object.
#'
#' @param x logmap object.
#' @param size point size.
#' @param color point color.
#' @param xlim limits for x-axis.
#'
#' @return NULL
#' @export
#'
plot.logmap <- function(x, size = 1, color = "black", xlim = c(0, 4)) {
  x <- as.data.frame(unclass(x))
  ggplot(x, aes_string(x = "r", y = "grow")) +
    geom_point(shape = ".", size = size, color = color) +
    scale_x_continuous() +
    scale_y_continuous(limits = c(0, 1)) +
    coord_cartesian(xlim)
}
