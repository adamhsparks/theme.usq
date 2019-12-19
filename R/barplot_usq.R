
#' @title Basic barplots using USQ colours and typography
#'
#' @description Basic barplots that follow USQ colour and typography
#' guidelines that uses (hopefully) sensible defaults.
#'
#' @param height Either a vector or matrix of values describing the bars which
#' make up the plot. If height is a vector, the plot consists of a sequence of
#' rectangular bars with heights given by the values in the vector. If height is
#' a matrix and beside is `FALSE` then each bar of the plot corresponds to
#' a column of height, with the values in the column giving the heights of
#' stacked sub-bars making up the bar. If height is a matrix and beside is
#' \code{TRUE}, then the values in each column are juxtaposed rather than
#' stacked.
#' @param col Colour to use as fill for the bars as a digit. Defaults to 1, "usq
#' charcoal". There are six colours that can be used, see \strong{Details} for
#' more.
#' @param ... Arguments to be passed to methods, such as graphical parameters
#' (see \code{\link[graphics]{par}}).
#'
#' @details
#' Names of colours for use in plots from the USQ Visual Identity Palette are
#' available from \code{link{usq_cols}}.
#'
#' @examples
#'
#' barplot_usq(islands, col = "secondary orange")
#'
#' @export
#'
barplot_usq <- function(height,
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

  opar <- graphics::par(no.readonly = TRUE)
  on.exit(graphics::par(opar))
  graphics::barplot(
    height = height,
    col = col,
    border = col,
    ...
  )
}
