
#' Palettes of USQ Colours
#' @format \code{Palettes} of USQ colours from the visual identity
#' colour palette for use in plotting.
#' @rdname usq_palettes
#' @examples
#' usq_palettes
#' @export

usq_palettes <- list(
  `primary` = usq_cols(
    "usq yellow",
    "usq charcoal",
    "secondary yellow",
    "secondary orange",
    "cool gray",
    "dark warm gray"
  ),

  `cool` = usq_cols("support navy",
                    "support blue",
                    "support turquiose"),

  `warm` = usq_cols(
    "support red",
    "support orange",
    "secondary orange",
    "secondary yellow",
    "usq yellow"
  ),

  `bright` = usq_cols(
    "support navy",
    "support blue",
    "support turquiose",
    "support green",
    "usq yellow",
    "secondary yellow",
    "secondary orange",
    "support orange",
    "support red",
    "support magenta",
    "support purple"
  ),

  `digital` = usq_cols("light grey",
                       "medium grey",
                       "dark grey")
)
