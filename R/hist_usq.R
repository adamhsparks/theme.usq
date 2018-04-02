
#' @title Basic Histograms Using USQ Colours and Typography
#'
#' @description Basic histograms that follow USQ colour and typography
#' guidelines that uses (hopefully) sensible defaults.
#'
#' @param x a vector of values for which the histogram is desired.
#' @param main Main title. Optional, if not supplied it will be blank.
#' @param sub Sub title below x-axis label. Optional, if not supplied it will be
#' blank.
#' @param xlab X-axis label. Optional, if not supplied will be taken from data.
#' @param ylab Y-axis label. Optional, if not supplied will default to "Count".
#' @param breaks Either \code{pretty}, default, or \code{exact}. Pretty uses
#' Scott's Rule, whereas exact uses a bin-width of 1 so each value is
#' represented individually with a bar.
#' @param col Colour to use as fill and outline for boxes and outlier points as
#' a digit. Defaults to "usq charcoal". There are fifteen colours that can be
#' used, see \strong{Details} for more.
#' @param ... Arguments to be passed to methods, such as graphical parameters
#' (see \code{\link[graphics]{par}}).
#'
#' @details
#' Names of colours for use in plots from the USQ Visual Identity Palette are
#' available from \code{link{usq_cols}}.
#'
#' @seealso \code{\link[graphics]{hist}} for full documentation of the basic
#' histogram capabilities
#'
#' @references
#' Scott, D.W. (1979) On optimal and data-based histograms. \emph{Biometrika},
#' 66, 605–610.
#'
#' Hyndman, R. J., The Problem with Sturges’ Rule for Constructing Histograms,
#' 1995, Monash University,
#' \url{https://www.robjhyndman.com/papers/sturges.pdf}.
#'
#' @examples
#'
#' hist_usq(islands)
#'
#' @export
#'
hist_usq <- function(x,
                     main = "",
                     sub = "",
                     xlab = "",
                     ylab = "Count",
                     breaks = "pretty",
                     col = "usq charcoal",
                     ...) {
  breaks <- tolower(breaks)

  col <- tolower(col)
  col <- usq_cols(col)


  if (breaks == "pretty") {
    breaks <- "scott"
  } else if (breaks == "exact") {
    # cleanup NAs in `x`
    x <- stats::na.omit(x)
    breaks <- seq(min(x), max(x),
                  by = ((max(x) - min(x)) /
                          (length(x) - 1)))
  } else {
    breaks <- "scott"
    message("You've selected an invalid value for `breaks`, using `pretty`.\n")
  }

  # set new pars
  graphics::par(
    family = "Verdana",
    pch = 16,
    fg = "#ffffff",
    bg = "#ffffff",
    col.axis = "#1e1e1e",
    col.lab = "#1e1e1e",
    las = 1,
    col.main = "#1e1e1e",
    col.sub = "#1e1e1e",
    tcl = -0.25,
    bty = "n",
    mgp = c(2, 0.5, 0),
    cex = 0.9
  )

  opar <- graphics::par(no.readonly = TRUE)
  on.exit(graphics::par(opar))
  graphics::hist.default(
    x,
    col = col,
    border = col,
    breaks = breaks,
    panel.first = graphics::grid(
      nx = NA,
      ny = NULL,
      col = "#efe9e5",
      lty = "solid"
    ),
    main = main,
    sub = sub,
    xlab = xlab,
    ylab = ylab,
    ...
  )
}
