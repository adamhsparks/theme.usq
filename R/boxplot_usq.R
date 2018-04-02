
#' @title Basic Boxplots Using USQ Colours and Typography
#'
#' @description Basic boxplots that follow USQ colour and typography
#' guidelines that uses (hopefully) sensible defaults.
#' @param x for specifying data from which the boxplots are to be produced.
#' Either a numeric vector, or a single list containing such vectors. Additional
#' unnamed arguments specify further data as separate vectors (each
#' corresponding to a component boxplot). \code{NA}s are allowed in the data.
#' @param main Main title. Optional, if not supplied it will be blank.
#' @param sub Sub title below x-axis label. Optional, if not supplied it will be
#' blank.
#' @param xlab X-axis label. Optional.
#' @param ylab Y-axis label. Optional.
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
#' @seealso \code{\link[graphics]{boxplot}} for full documentation of the basic
#' boxplot capabilities
#' @examples
#' # plot using "secondary orange" as the fill colour
#'
#' rb <- boxplot_usq(decrease ~ treatment,
#'                   data = OrchardSprays,
#'                   col = "secondary orange")
#' title("Comparing boxplot()s and non-robust mean +/- SD")
#'
#' @export
#'
boxplot_usq <- function(x,
                        main = "",
                        sub = "",
                        xlab = "",
                        ylab = "",
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
    mgp = c(2, 0.5, 0),
    cex = 0.9
  )

  opar <- graphics::par(no.readonly = TRUE)
  on.exit(graphics::par(opar))
  graphics::plot.new()
  graphics::grid(
    nx = NA,
    ny = NULL,
    col = "#efe9e5",
    lty = "solid"
  )
  graphics::par(new = TRUE)
  graphics::boxplot(
    x,
    col = scales::alpha(col, 0.5),
    border = col,
    pars = list(boxwex = 0.8,
                staplewex = 0.5,
                outwex = 0.5,
                cex = 1,
                whisklty = "solid"),
    title = list(line = 2),
    main = main,
    sub = sub,
    xlab = xlab,
    ylab = ylab,
    ...
  )
}
