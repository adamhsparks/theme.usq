
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
#' @param col Colour to use as fill and outline for boxes and outlier points as
#' a digit. Defaults to "usq charcoal". There are fifteen colours that can be
#' used, see \strong{Details} for more.
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
#' Names of colours for use in plots from the USQ Visual Identity Palette are
#' available from \code{link{usq_cols}}.
#' @seealso
#' \code{\link[graphics]{plot}} for full documentation of the basic plotting
#' capabilities.
#' @examples
#' library(datasets)
#'
#' plot_usq(airquality$Ozone,
#'          col = "usq charcoal",
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
                     col = "usq charcoal",
                     ...) {

  col <- tolower(col)
  col <- usq_cols(col)

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
    cex = 0.9
  )

  xy <- grDevices::xy.coords(x, y)
  if (is.null(xlim))
    xlim <- range(xy$x[is.finite(xy$x)])
  if (is.null(ylim))
    ylim <- range(xy$y[is.finite(xy$y)])
  opar <- graphics::par(no.readonly = TRUE)
  on.exit(graphics::par(opar))
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
