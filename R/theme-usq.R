
#' A theme based on USQ visual identity and typography guidelines.
#'
#' @example inst/examples/ex-theme_usq.R
#'
#' @export
#' @rdname usq_theme
#' @importFrom ggplot2 %+replace%
theme_usq <- function(base_size = 11,
                      base_family = "Verdana",
                      base_line_size = base_size / 22,
                      base_rect_size = base_size / 22) {
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
