

.onLoad <-
  function(libname, pkgname) {
    # check for existence of Verdana.afm file before importing to avoid message
    # import as necessary
    if (!file.exists(system.file("metrics",
                                 "Verdana.afm.gz",
                                 package = "extrafontdb"))) {
      extrafont::font_import(prompt = FALSE,
                             recursive = FALSE)
    }

    pdfFonts <- grDevices::pdfFonts
    postscriptFonts <- grDevices::postscriptFonts

    extrafont::loadfonts(device = "pdf", quiet = TRUE)
    extrafont::loadfonts(device = "postscript", quiet = TRUE)

    if (.Platform$OS.type == "windows") {
      windowsFonts <- grDevices::windowsFonts
      extrafont::loadfonts(device = "win", quiet = TRUE)
    } else if (Sys.info()["sysname"] == "Darwin") {
      grDevices::quartzFonts(Verdana = c(
        "Verdana",
        "Verdana Bold",
        "Verdana Italic",
        "Verdana Bold Italic"
      ))
    } else {
      grDevices::X11Fonts(Verdana = c(
        "Verdana",
        "Verdana Bold",
        "Verdana Italic",
        "Verdana Bold Italic"
      ))
    }

  }
