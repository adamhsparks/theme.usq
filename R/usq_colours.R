
#' Palettes and functions for the theme.usq package
#'
#' Provides colours for graphing using USQ's visual identity
#' colour palette.
#'
#' See \code{\link{theme_usq}} for examples.
#'
#' @export
#' @format A \code{ggplot2} gradient colour function.
#' @export
#' @rdname usq_colour_gradient
usq_colour_gradient_warm <- function() {
  ggplot2::scale_colour_gradientn(colours = c("#e63e30",
                                              "#ffd100",
                                              "#efe9e5"))
}

#' @export
#' @rdname usq_colour_gradient
usq_fill_gradient_warm <- function() {
  ggplot2::scale_fill_gradientn(colours = c("#e63e30",
                                            "#ffd100",
                                            "#efe9e5"))
}

#' @export
#' @rdname usq_colour_gradient
usq_fill_gradient_cool <- function() {
  ggplot2::scale_fill_gradientn(colours = c("#003d77",
                                            "#0090ba",
                                            "#efe9e5"))
}

#' @export
#' @rdname usq_colour_gradient
usq_colour_gradient_cool <- function() {
  ggplot2::scale_colour_gradientn(colours = c("#003d77",
                                              "#0090ba",
                                              "#efe9e5"))
}

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
