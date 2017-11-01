
#' @title Basic X-Y Plotting Using USQ Colours and Typography
#'
#' @description Basic X-Y plotting that follows USQ colour and typography
#' guidelines that uses (hopefully) sensible defaults.
#'
#' @param x Values to be plotted on x-axis.
#' @param y Values to be used on y-axis. Optional.
#' @param main Main title text
#' @param sub Subtitle text below x-axis label
#' @param xlab X-axis label. Optional, if blank will default to data supplied
#' label.
#' @param ylab Y-axis label. Optional, if blank will default to data supplied
#' label if one is available.
#' @param xlim Numeric value for x-axis limits. Optional.
#' @param ylim Numeric value for y-axis limits. Optional.
#' @param col Colour to use as fill for the bars as a digit. Defaults to 1, USQ
#' Charcoal. There are six colours that can be used, see \strong{Details} for
#' more.
#' @param ... Arguments to be passed to methods, such as graphical parameters
#' (see \code{\link[graphics]{par}}). The most commonly used argument would be
#' \code{type} what type of plot should be drawn. Possible types are:
#'  \itemize{
#'  \item{"p"} {for \strong{p}oints},
#'  \item{"l"} for \strong{l}ines,
#'  \item{"b"} for \strong{b}oth,
#'  \item{"c"} for the lines part alone of "\strong{b}",
#'  \item{"o"} for both ‘\strong{o}verplotted’,
#'  \item{"h"} for ‘\strong{h}istogram’ like (or ‘\strong{h}igh-density’)
#'  vertical lines,
#'  \item{"s"} for stair \strong{s}teps,
#'  \item{"n"} for \strong{n}o plotting.
#'  }
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
#' @seealso
#' \code{\link[graphics]{plot}} for full documentation of the basic plotting
#' capabilities.
#' @examples
#' library(datasets)
#'
#' plot_usq(airquality$Ozone,
#'          col = 3,
#'          main = "Air Quality",
#'          xlab = "Ozone")
#'
#' @export
#'
plot_usq <- function(x,
                     y = NULL,
                     main = "",
                     sub = "",
                     xlab = "",
                     ylab = "",
                     xlim = NULL,
                     ylim = NULL,
                     col = 1,
                     ...) {
  if (col > 6 | col == 0) {
    col <- 1
    message(
      "You've selected a colour outside the range of this function.\n",
      "Defaulting to USQ Charcoal\n"
    )
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
    cex = 0.9
  )

  xy <- grDevices::xy.coords(x, y)
  if (is.null(xlim))
    xlim <- range(xy$x[is.finite(xy$x)])
  if (is.null(ylim))
    ylim <- range(xy$y[is.finite(xy$y)])
  opar <- graphics::par(no.readonly = TRUE)
  on.exit(par(opar))
  graphics::plot.new()
  graphics::plot(xlab = xlab, ylab = ylab, xlim, ylim, ...)
  graphics::grid(
    nx = NA,
    ny = NULL,
    col = "#efe9e5",
    lty = "solid"
  )
  graphics::points(xy$x, xy$y, col = col, ...)
  graphics::axis(side = 1)
  graphics::axis(side = 2)
  graphics::box()
}
