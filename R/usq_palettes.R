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
