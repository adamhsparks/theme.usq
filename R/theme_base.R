#' @title theme_usq_base
#'
#' @description USQ themed plots for R base graphics
#'
#' @export
#'
theme_usq_base <- function() {
  styles::new_style(
    par = list(
      family = "verdana",
      pch = 16,
      fg = "#efe9e5",
      col.axis = grey(0.4),
      col.lab = grey(0.2),
      las = 1,
      col.main = "#1e1e1e",
      col.sub = "#1e1e1e",
      tcl = -0.25,
      bty = "l"
    ),
    graphics = list(
      axis = list(hadj = 0.5),
      hist.default = list(
        col = "#1e1e1e",
        border = "white",
        main = "",
        ylab = "count",
        axes = FALSE
      ),
      plot.default = list(panel.first = c(x = NA, y = NULL)),
      plot.xy = list(col = "#1e1e1e",
                     lwd = 2.5,
                     cex = 1.1),
      barplot.default = list(
        col = "#1e1e1e",
        border = NA,
        space = 0.3
      ),
      boxplot.default = list(
        col = "#ffd100",
        border = "#1e1e1e",
        pars = list(
          boxwex = 0.8,
          staplewex = 0.5,
          outwex = 0.5,
          cex = 1,
          whisklty = "solid"
        )
      ),
      title = list(line = 2)
    )
  )



}
