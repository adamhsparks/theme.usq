
.onLoad <-
  function(libname = find.package("usq.theme"),
           pkgname = "usq.theme") {
    # check for existence of Verdana.afm file before importing to avoid message
    fname <-
      system.file("metrics", "Verdana.afm.gz", package = "extrafontdb")

    if (!file.exists(fname)) {
      extrafont::font_import(pattern = "Verdana", prompt = FALSE)
    }

    pdfFonts <- grDevices::pdfFonts
    extrafont::loadfonts(device = "pdf", quiet = TRUE)

    # CRAN Note avoidance
    if (getRversion() >= "2.15.1") {
      utils::globalVariables(c("."))
    }
  }
