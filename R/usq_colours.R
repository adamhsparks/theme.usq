
#' USQ colours
#' @format A \code{vector} of USQ colours from the visual identity
#' colour palette.
#' @rdname usq_colours
#' @export
usq_colours <-
  c(
    `usq yellow` = "#ffd100",
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
    `support turquiose` = "#46c1be",
    `light grey` = "#f6f6f6",
    `medium grey` = "#e5e5e5",
    `dark grey` = "#333333",
    `unspecified brown` = "#a17401",
    `unknown deep blue green` = "#005670"
  )

#' Function to extract USQ colours as hex codes
#'
#' @param ... Character names of \pkg{theme.usq} colours
#' @examples
#' # get the hex code for usq yellow
#' usq_cols("usq yellow")
#' @export
usq_cols <- function(...) {
  cols <- tolower(c(...))
  if (is.null(cols))
    return(usq_colours)
  usq_colours[cols]
}

#' Return function to interpolate a USQ colour palette
#'
#' @param p Character name of palette in `usq_palettes()`
#' @param r Boolean indicating whether the palette should be reversed
#' @param a Alpha transparency value between 1 and 0, where 1 = no transparency
#' and 0 = transparent
#' @param ... Additional arguments to pass to `colorRampPalette()`
#' @export
usq_pal <- function(p = "primary",
                    r = FALSE,
                    a = 1,
                    ...) {
  pal <- usq_palettes[[p]]

  if (r)
    pal <- rev(pal)

  grDevices::colorRampPalette(pal, ...)
}

#' Return function to provide USQ colours in given order
#'
#' @param usq_palettes List of USQ themed colour palettes
#' @param palette Name of desired palette to use, _e.g._ "primary", "warm", ...
#' @keywords internal
#' @noRd
usq_pal_ordered <- function(usq_palettes = usq_palettes, palette) {
  return(unname(usq_palettes[[palette]]))
}
