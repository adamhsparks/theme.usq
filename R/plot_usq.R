
#' @title Basic X-Y Plotting Using USQ Colours and Typography
#'
#' @description Basic X-Y plotting that follows USQ colour and typography
#' guidelines that uses (hopefully) sensible defaults.
#'
#' @param col Colour to use for points as a digit. Defaults to 1, USQ Charcoal.
#' There are six colours that can be used.
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
#' @examples
#' plot_usq(1:3)
#'
#' @export
#'
plot_usq <- function(x,
                     y = NULL,
                     main = "",
                     sub = "",
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
    bty = "n"
  )

  xy <- grDevices::xy.coords(x, y)
  if (is.null(xlim))
    xlim <- range(xy$x[is.finite(xy$x)])
  if (is.null(ylim))
    ylim <- range(xy$y[is.finite(xy$y)])
  opar <- graphics::par(no.readonly = TRUE)
  on.exit(par(opar))
  graphics::plot.new()
  graphics::plot.window(xlim, ylim, ...)
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

  graphics::title(
    main = main,
    sub = sub,
    xlab = xy$xlab,
    ylab = xy$ylab
  )
}
