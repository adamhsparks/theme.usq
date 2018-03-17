#' A vector of USQ Colours That Conforms to USQ's Colour Identity
#' @format A \code{vector} of USQ colours from the visual identity
#' colour palette.
#' @rdname usq_colours
#' @export

usq_colours <-
  c(
    `usq yellow` = "ffd100",
    `usq charcoal` = "#1e1e1e",
    `secondary yellow` = "#fdba12",
    `secondary orange` = "#faa61a",
    `cool gray` = "#76848f",
    `dark warm gray` = "#aca095",
    `light_warm gray` = "#efe9e5",
    `support orange` = "#f58220",
    `support red` = "#e63e30",
    `support magenta` = "#b63393",
    `support green` = "#63a945",
    `support blue` = "#0090ba",
    `support navy` = "#003d77",
    `support purple` = "#6a288a",
    `support turquiose` = "#46c1be"
  )

#' Function to extract USQ colors as hex codes
#'
#' @param ... Character names of theme.usq colours
#'
usq_cols <- function(...) {
  cols <- c(...)
  if (is.null(cols))
    return(usq_colours)
  usq_colours[cols]
}

#' A palette of USQ Colours That Conforms to USQ's Colour Identity
#' @format \code{Palettes} of USQ colours from the visual identity
#' colour palette.
#' @rdname usq_colours
#' @export

usq_palettes <- list(
  `primary`  = usq_cols("usq yellow",
                        "usq charcoal",
                        "secondary yellow",
                        "secondary orange",
                        "cool gray",
                        "dark warm gray"),

  `cool`  = usq_cols("support navy",
                     "support blue",
                     "light warm gray"),

  `warm`   = usq_cols("support red",
                      "usq yellow",
                      "light warm gray"),

  `bright` = usq_cols("support orange",
                      "support magenta",
                      "support blue",
                      "support green",
                      "support navy",
                      "support purple",
                      "support turquoise")
)

#' Return function to interpolate a USQ color palette
#'
#' @param palette Character name of palette in usq_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette()
#'
usq_pal <- function(palette = "main", reverse = FALSE, ...) {
  pal <- usq_palettes[[palette]]

  if (reverse) pal <- rev(pal)

  colorRampPalette(pal, ...)
}

#' Color scale constructor for USQ colors
#'
#' @param palette Character name of palette in usq_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to `discrete_scale()` or
#'            `scale_color_gradientn()`, used respectively when discrete is TRUE
#'            or FALSE
#'
scale_color_usq <- function(palette = "main",
                            discrete = TRUE,
                            reverse = FALSE,
                            ...) {
  pal <- usq_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("colour", paste0("usq_", palette), palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}

#' Fill scale constructor for USQ colors
#'
#' @param palette Character name of palette in usq_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to `discrete_scale()` or
#'            `scale_fill_gradientn()`, used respectively when discrete is TRUE or
#'            FALSE
#'
scale_fill_usq <- function(palette = "main",
                           discrete = TRUE,
                           reverse = FALSE,
                           ...) {
  pal <- usq_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("fill", paste0("usq_", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}
