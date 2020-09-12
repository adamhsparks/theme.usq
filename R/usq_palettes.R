
#' Palettes of USQ colours
#' @format `Palettes` of USQ colours from the visual identity
#'  colour palette for use in plotting.
#' @rdname usq_palettes
#' @examples
#' usq_palettes
#' @export

usq_palettes <- list(
  primary = usq_cols(
    "secondary yellow",
    "support magenta",
    "support turquiose",
    "support red",
    "support green",
    "support navy",
    "unspecified brown",
    "support purple",
    "unknown deep blue green"
  ),

  `primary dark` = usq_cols(
    "usq charcoal",
    "cool gray",
    "dark warm gray"
  ),

  `primary light` = usq_cols(
    "usq yellow",
    "secondary yellow",
    "secondary orange"
  ),

  cool = usq_cols(
    "support navy",
    "support blue",
    "support turquiose"),

  warm = usq_cols(
    "support red",
    "support orange",
    "secondary orange",
    "secondary yellow",
    "usq yellow"
  ),

  bright = usq_cols(
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

  digital = usq_cols(
    "light grey",
    "medium grey",
    "dark grey")
)
