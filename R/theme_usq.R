
#' A ggplot2 theme based on USQ visual identity and typography guidelines
#'
#' This theme applies a standard USQ style to \CRANpkg{ggplot2} graphs,
#' which includes no y-axis lines, major x-axis grid lines and the Microsoft's
#' typeface, Verdana, for all text labelling and the legend key at the bottom.
#'
#' The base size is set to 11 by default.  For presentations using the option,
#' \code{base_size} will make the fonts larger and more suitable for
#' presentation slides, \emph{e.g.}, \code{theme_usq(base_size = 24)}.
#'
#' @examples
#'
#' library(ggplot2)
#'
#' # Discrete values
#' p1 <- ggplot(mtcars) +
#'   geom_point(aes(
#'     x = wt,
#'     y = mpg,
#'     colour = factor(gear)
#'    )) +
#'   scale_colour_usq("primary") +
#'   facet_wrap(~ am) +
#'   theme_usq()
#' p1
#'
#' # Continuous values
#' df <- reshape2::melt(outer(1:4, 1:4), varnames = c("X1", "X2"))
#'
#' p2 <- ggplot(df, aes(X1, X2)) + geom_tile(aes(fill = value)) +
#'   scale_fill_usq("warm",
#'   discrete = FALSE)
#' p3 <- p2 + geom_point(aes(size = value)) +
#'   theme_usq()
#' p3
#'
#' # Larger base size for presentation slides
#' p4 <- p3 + geom_point(aes(size = value)) +
#'   theme_usq(base_size = 24)
#' p4
#'
#' @inheritParams ggplot2::theme_bw
#' @export
#' @rdname theme_usq
#' @importFrom ggplot2 %+replace%
#'
theme_usq <- function(base_size = 11,
                      base_family = "Verdana") {
  colours <-
    ggplot2::theme_bw(base_size = base_size,
                      base_family = base_family) %+replace%
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
        fill = "#1e1e1e",
        colour = "#ffffff",
        size = ggplot2::rel(2)
      ),
      strip.text = ggplot2::element_text(
        colour = "#ffffff",
        family = "Verdana",
        margin = ggplot2::margin(0.1, 0.1, 0.1, 0.1, "cm")
      ),
      complete = TRUE
    )
  return(colours)
}
