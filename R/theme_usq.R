
#' A ggplot2 Theme Based on USQ Visual Identity and Typography Guidelines
#'
#' @examples
#' \dontrun{
#' Discrete values
#' p1 <- ggplot(mtcars) +
#'   geom_point(aes(
#'     x = wt,
#'     y = mpg,
#'     colour = factor(gear)
#'    )) +
#'   scale_colour_manual(values = usq_palette) +
#'   facet_wrap(~ am) +
#'   theme_usq()
#' p1
#'
#' # Continous values
#' df <- reshape2::melt(outer(1:4, 1:4), varnames = c("X1", "X2"))
#'
#' p2 <- ggplot(df, aes(X1, X2)) + geom_tile(aes(fill = value)) +
#'   usq_fill_gradient()
#' p3 <- p2 + geom_point(aes(size = value)) +
#'   theme_usq()
#' p3
#' }
#'
#' @inheritParams ggplot2::theme_bw
#' @export
#' @rdname theme_usq
#' @importFrom ggplot2 %+replace%
theme_usq <- function(base_size = 11,
                      base_family = "Verdana",
                      base_line_size = base_size / 22,
                      base_rect_size = base_size / 22) {
  colors <-
  ggplot2::theme_bw(
    base_size = base_size,
    base_family = base_family,
    base_line_size = base_line_size,
    base_rect_size = base_rect_size
  ) %+replace%
    ggplot2::theme(
      # no background no minor grid no axis line
      panel.border = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank(),
      panel.grid.major.x = ggplot2::element_blank(),
      axis.line = ggplot2::element_blank(),
      axis.ticks = ggplot2::element_blank(),
      legend.position = "bottom",

      # match legend key to panel.background
      legend.key = ggplot2::element_blank(),

      # USQ colour facet strips
      strip.background = ggplot2::element_rect(
        fill = "#ffd100",
        colour = "#efe9e5",
        size = ggplot2::rel(2)
      ),

      complete = TRUE
    )
}
