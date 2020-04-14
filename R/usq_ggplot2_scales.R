
#' ggplot2 colour scale constructor for USQ colours
#'
#' @param palette Character name of palette in `usq_palettes()`
#' @param discrete Boolean indicating whether colour aesthetic is discrete or
#'  not
#' @param alpha Transparency value from 1 - no transparency to 0 - fully
#'  transparent
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param interpolate Boolean indicating whether to interpolate colours or not.
#'  This can be used when you wish to use a colour palette that does not have
#'  sufficient individual colours for a given aesthetic for discrete variables.
#'  Defaults to `FALSE`.
#' @param ... Additional arguments passed to `discrete_scale()` or
#'            `scale_colour_gradientn()`, used respectively when discrete is
#'            `TRUE` or `FALSE`
#'
#' @export

scale_colour_usq <- function(palette = "primary",
                             discrete = TRUE,
                             alpha  = 1,
                             reverse = FALSE,
                             interpolate = FALSE,
                             ...) {
  if (isTRUE(discrete)) {
    if (isTRUE(interpolate)) {
      pal <- usq_pal(p = palette, r = reverse)
      ggplot2::discrete_scale("colour",
                              paste0("usq_",
                                     palette),
                              palette = pal, ...)
    } else {
      ggplot2::scale_colour_manual(...,
                                   values = usq_pal_ordered(usq_palettes,
                                                            palette = palette))
    }
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
#' @param interpolate Boolean indicating whether to interpolate colours or not.
#'  This can be used when you wish to use a colour palette that does not have
#'  sufficient individual colours for a given aesthetic for discrete variable.
#'  Defaults to `FALSE`.
#' @param ... Additional arguments passed to `discrete_scale()` or
#'            `scale_fill_gradientn()`, used respectively when discrete is TRUE
#'            or FALSE
#' @export
scale_fill_usq <- function(palette = "primary",
                           discrete = TRUE,
                           reverse = FALSE,
                           interpolate = FALSE,
                           ...) {
  if (isTRUE(discrete)) {
    if (isTRUE(interpolate)) {
      pal <- usq_pal(p = palette, r = reverse)
      ggplot2::discrete_scale("fill",
                              paste0("usq_", palette),
                              palette = pal,
                              ...)
    } else {
      ggplot2::scale_fill_manual(...,
                                 values = usq_pal_ordered(usq_palettes,
                                                          palette = palette))
    }
  } else {
    pal <- usq_pal(p = palette, r = reverse)
    ggplot2::scale_fill_gradientn(colours = pal(256), ...)
  }
}
