
#' @title Basic barplots Using USQ Colours and Typography
#'
#' @description Basic barplots that follow USQ colour and typography
#' guidelines that uses (hopefully) sensible defaults.
#'
#' @param height Either a vector or matrix of values describing the bars which
#' make up the plot. If height is a vector, the plot consists of a sequence of
#' rectangular bars with heights given by the values in the vector. If height is
#' a matrix and beside is \code{FALSE} then each bar of the plot corresponds to
#' a column of height, with the values in the column giving the heights of
#' stacked sub-bars making up the bar. If height is a matrix and beside is
#' \code{TRUE}, then the values in each column are juxtaposed rather than
#' stacked.
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
#' @examples
#'
#' barplot_usq(islands)
#'
#' @export
#'
barplot_usq <- function(height,
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

  opar <- graphics::par(no.readonly = TRUE)
  on.exit(par(opar))
  graphics::barplot(
    height = height,
    col = col,
    border = col,
    ...
  )
}
