
#' ggplot2 Colour Scale Constructor for USQ Colours
#'
#' @param palette Character name of palette in `usq_palettes()`
#' @param discrete Boolean indicating whether colour aesthetic is discrete or
#' not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to `discrete_scale()` or
#'            `scale_colour_gradientn()`, used respectively when discrete is
#'            `TRUE` or `FALSE`
#'
#' @export
scale_colour_usq <- function(palette = "primary",
                             discrete = TRUE,
                             reverse = FALSE,
                             ...) {
  pal <- usq_pal(palette = palette, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale("colour", paste0("usq_", palette), palette = pal, ...)
  } else {
    ggplot2::scale_colour_gradientn(colours = pal(256), ...)
  }
}

#' ggplot2 Fill Scale Constructor for USQ Colours
#'
#' @param palette Character name of palette in `usq_palettes()`
#' @param discrete Boolean indicating whether colour aesthetic is discrete or
#' not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to `discrete_scale()` or
#'            `scale_fill_gradientn()`, used respectively when discrete is TRUE
#'            or FALSE
#' @export
scale_fill_usq <- function(palette = "primary",
                           discrete = TRUE,
                           reverse = FALSE,
                           ...) {
  pal <- usq_pal(palette = palette, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale("fill", paste0("usq_", palette), palette = pal, ...)
  } else {
    ggplot2::scale_fill_gradientn(colours = pal(256), ...)
  }
}
