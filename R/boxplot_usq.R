
#' @title Basic Boxplots Using USQ Colours and Typography
#'
#' @description Basic boxplots that follow USQ colour and typography
#' guidelines that uses (hopefully) sensible defaults.
#'
#' @param main Main title. Optional, if not supplied it will be blank.
#' @param sub Sub title below x-axis label. Optional, if not supplied it will be
#' blank.
#' @param xlab X-axis label. Optional.
#' @param ylab Y-axis label. Optional.
#' @param col Colour to use as fill and outline for boxes and outlier points as
#' a digit. Defaults to 1, USQ Charcoal. There are six colours that can be used,
#' see \strong{Details} for more.
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
#' @seealso \code{\link[graphics]{boxplot}}  for full documentation of the basic
#' boxplot
#' capabilities
#' @examples
#' rb <- boxplot_usq(decrease ~ treatment, data = OrchardSprays)
#' title("Comparing boxplot()s and non-robust mean +/- SD")
#'
#' @export
#'
boxplot_usq <- function(x,
                        main = "",
                        sub = "",
                        xlab = "",
                        ylab = "",
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
    mgp = c(2, 0.5, 0),
    cex = 0.9
  )

  opar <- graphics::par(no.readonly = TRUE)
  on.exit(par(opar))
  graphics::plot.new()
  graphics::grid(
    nx = NA,
    ny = NULL,
    col = "#efe9e5",
    lty = "solid"
  )
  par(new = TRUE)
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