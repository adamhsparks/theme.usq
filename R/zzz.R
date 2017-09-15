
.onLoad <-
  function(libname, pkgname) {
    # check for existence of Verdana.afm file before importing to avoid message
    # import as necessary
    if (!file.exists(
      system.file("metrics", "Verdana.afm.gz", package = "extrafontdb"))) {
      extrafont::font_import(pattern = "Verdana",
                             prompt = FALSE,
                             recursive = FALSE
                             )
    }

    pdfFonts <- grDevices::pdfFonts
    postscriptFonts <- grDevices::postscriptFonts

    extrafont::loadfonts(device = "pdf", quiet = TRUE)
    extrafont::loadfonts(device = "postscript", quiet = TRUE)

    if (.Platform$OS.type == "windows") {
      extrafont::loadfonts("win", quiet = TRUE)
    }
  }
