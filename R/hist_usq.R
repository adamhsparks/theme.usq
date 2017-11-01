
#' @title Basic Histograms Using USQ Colours and Typography
#'
#' @description Basic histograms that follow USQ colour and typography
#' guidelines that uses (hopefully) sensible defaults.
#'
#' @param main Main title. Optional, if not supplied it will be blank.
#' @param sub Sub title below x-axis label. Optional, if not supplied it will be
#' blank.
#' @param xlab X-axis label. Optional, if not supplied will be taken from data.
#' @param ylab Y-axis label. Optional, if not supplied will default to "Count".
#' @param breaks Either \code{pretty}, default, or \code{exact}. Pretty uses
#' Scott's Rule, whereas exact uses a bin-width of 1 so each value is
#' represented individually with a bar.
#' @param col Colour to use as fill for the bars as a digit. Defaults to 1, USQ
#' Charcoal. There are six colours that can be used, see \strong{Details} for
#' more.
#' @param ... Arguments to be passed to methods, such as graphical parameters
#' (see \code{\link[graphics]{par}}).
#'
#' @details
#' Colours for use in plots from the USQ Visual Identity Palette as a valid
#' value for \code{col} include:
#'  \itemize{
#'    \item{1} {- USQ Charcoal}
#'    \item{2} {- USQ Yellow}
#'    \item{3} {- Dark Warm Gray}
#'    \item{4} {- Support Green}
#'    \item{5} {- Secondary Orange}
#'    \item{6} {- Support Blue}
#'  }
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
                     col = 1,
                     ...) {
  breaks <- tolower(breaks)

  if (col > 6 | col == 0) {
    col <- 1
    message(
      "You've selected a colour outside the range of this function.\n",
      "Defaulting to USQ Charcoal\n"
    )
  }

  if (breaks == "pretty") {
    breaks <- "scott"
  } else if (breaks == "exact") {
    # cleanup NAs in `x`
    x <- na.omit(x)
    breaks <- seq(min(x), max(x),
                  by = ((max(x) - min(x)) /
                          (length(x) - 1)))
  } else {
    breaks <- "scott"
    message("You've selected an invalid value for `breaks`, using `pretty`.\n")
  }

  colour <- usq_palette[1:6]
  col <- colour[col]

  # set new pars
  par(
    family = "verdana",
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
  on.exit(par(opar))
  graphics::hist.default(
    x,
    col = col,
    border = "white",
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
