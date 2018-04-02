
.onLoad <-
  function(libname, pkgname) {
    pdfFonts <- grDevices::pdfFonts
    postscriptFonts <- grDevices::postscriptFonts

    if (.Platform$OS.type == "windows") {
      # check for Verdana.afm file before importing to avoid message
      # import as necessary
      if (!file.exists(system.file("metrics",
                                   "Verdana.afm.gz",
                                   package = "extrafontdb"))) {
        extrafont::font_import(prompt = FALSE,
                               recursive = FALSE)
      } #if Verdana still not found, do a recursive import
      if (!file.exists(system.file("metrics",
                                   "Verdana.afm.gz",
                                   package = "extrafontdb"))) {
        extrafont::font_import(prompt = FALSE,
                               recursive = TRUE)
      }
      windowsFonts <- grDevices::windowsFonts
      extrafont::loadfonts(device = "pdf", quiet = TRUE)
      extrafont::loadfonts(device = "postscript", quiet = TRUE)
      extrafont::loadfonts(device = "win", quiet = TRUE)
    } else if (Sys.info()["sysname"] == "Darwin") {
      # check for Verdana.afm file before importing to avoid message
      # import as necessary
      if (!file.exists(system.file("metrics",
                                   "Verdana.afm.gz",
                                   package = "extrafontdb"))) {
        extrafont::font_import(prompt = FALSE,
                               recursive = FALSE)
      }  #if Verdana still not found, do a recursive import
      if (!file.exists(system.file("metrics",
                                   "Verdana.afm.gz",
                                   package = "extrafontdb"))) {
        extrafont::font_import(prompt = FALSE,
                               recursive = TRUE)
      }
      extrafont::loadfonts(device = "pdf", quiet = TRUE)
      extrafont::loadfonts(device = "postscript", quiet = TRUE)
      grDevices::quartzFonts("Verdana" = c(
        "Verdana",
        "Verdana Bold",
        "Verdana Italic",
        "Verdana Bold Italic"
      ))
    } else {
      # check for Verdana.afm file before importing to avoid message
      # import as necessary
      if (!file.exists(system.file("metrics",
                                   "Verdana.afm.gz",
                                   package = "extrafontdb"))) {
        extrafont::font_import(prompt = FALSE,
                               recursive = TRUE)
      }
      extrafont::loadfonts(device = "pdf", quiet = TRUE)
      extrafont::loadfonts(device = "postscript", quiet = TRUE)
    }
  }
