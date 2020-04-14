
#' ggplot2 colour scale constructor for USQ colours
#'
#' @param palette Character name of palette in `usq_palettes()`
#' @param discrete Boolean indicating whether colour aesthetic is discrete or
#'  not
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
  if (isTRUE(discrete)) {
    ggplot2::scale_colour_manual(...,
                                 values = usq_pal_ordered(usq_palettes,
                                                          palette = palette))
  } else {
    pal <- usq_pal(p = palette, r = reverse)
    ggplot2::scale_colour_gradientn(colours = pal(256), ...)
  }
}

#' ggplot2 fill scale constructor for USQ colours
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
  if (isTRUE(discrete)) {
    ggplot2::scale_fill_manual(...,
                               values = usq_pal_ordered(usq_palettes,
                                                        palette = palette))
  } else {
    pal <- usq_pal(p = palette, r = reverse)
    ggplot2::scale_fill_gradientn(colours = pal(256), ...)
  }
}
