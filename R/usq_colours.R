
#' Palettes and functions for the theme.usq package
#'
#' Provides colours for graphing using USQ's visual identity
#' colour palette.
#'
#' See \code{\link{theme_usq}} for examples.
#'
#' @name usq_palette
#' @export
#' @format A \code{ggplot2} gradient colour function.
#' @export
usq_colour_gradient <- function() {
  ggplot2::scale_colour_gradientn(colours = c("#e63e30",
                                              "#fdba12",
                                              "#ffd100"))
}

#' @name usq_palette
#' @export
usq_fill_gradient <- function() {
  ggplot2::scale_fill_gradientn(colours = c("#e63e30",
                                            "#fdba12",
                                            "#ffd100"))
}

#' @name usq_palette
#' @format A \code{ggplot2} gradient fill function.
#' @export
usq_fill_gradient <- function() {
  ggplot2::scale_fill_gradientn(colours = c("#e63e30",
                                            "#fdba12",
                                            "#ffd100"))
}

#' @name usq_palette
#' @format A \code{vector} of USQ colours from the visual identity
#' colour palette.
#' @export
usq_palette <-
  c(
    "#1e1e1e",
    "#ffd100",
    "#aca095",
    "#63a945",
    "#faa61a",
    "#0090ba",
    "#e63e30",
    "#b63393",
    "#fdba12",
    "#6a288a",
    "#003d77",
    "#f58220",
    "#46c1be",
    "#76848f"
  )
