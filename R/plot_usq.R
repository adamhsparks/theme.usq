
#' @title Basic X-Y Plotting Using USQ Colours and Typography
#'
#' @description Basic X-Y plotting that follows USQ colour and typography
#' guidelines.
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
                     ann = par("ann"),
                     ...) {

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

  xy <- xy.coords(x, y)
  if (is.null(xlim))
    xlim <- range(xy$x[is.finite(xy$x)])
  if (is.null(ylim))
    ylim <- range(xy$y[is.finite(xy$y)])
  opar <- par(no.readonly = TRUE)
  on.exit(par(opar))
  plot.new()
  plot.window(xlim, ylim, ...)
  grid(nx = NA, ny = NULL, col = "#efe9e5", lty = "solid")
  points(xy$x, xy$y, col = "#aca095", ...)
  axis(1)
  axis(2)
  box()

  if (ann)
    title(
      main = main,
      sub = sub,
      xlab = xy$xlab,
      ylab = xy$ylab,
      ...
    )
}
