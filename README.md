theme.usq
================

![pkgdown](https://github.com/adamhsparks/theme.usq/workflows/pkgdown/badge.svg)
[![Build
status](https://ci.appveyor.com/api/projects/status/kl8y1bvwakd4884r/branch/master?svg=true)](https://ci.appveyor.com/project/adamhsparks/theme-usq-8c8gf/branch/master)
[![DOI](https://zenodo.org/badge/103536536.svg)](https://zenodo.org/badge/latestdoi/103536536)
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)

## Introduction to *theme.usq*

The goal of ***`theme.usq`*** is to provide [University of Southern
Queensland](https://usq.edu.au) (USQ) staff and students a quick and
easy way to apply USQ colours and typography to graphs created in R
using the base ***`graphics`*** package or ***`ggplot2`*** while
providing clear graphs for reports and presentations. All of the colours
provided are defined in USQ’s Visual Identity Colour Palette, but do not
all appear in the same order to maintain usability for the purposes of
graphing.

This package has been tested on macOS, Ubuntu Linux and USQ computers
using Windows 7. For Linux users, if you have not installed the MS Core
Fonts, you will need to do that for this package to function properly
and generate the graphs with the proper typography. Windows and macOS
users should be ready to go with just the installation of this package.

## Quickstart

If you do not already have R installed, because ***`theme.usq`*** is an
R package, you will need to install R first. Download and install the
proper version for your computer from
[CRAN](https://cran.r-project.org). It is also suggested to have RStudio
installed as well. You can download the proper installation file from
<https://www.rstudio.com/products/rstudio/download/> for your platform.

Once R and RStudio are set up, you’re ready to install ***`theme.usq`***
through an R session.

The ***`theme.usq`*** package is only available from GitHub. The easiest
way to install it is by using the
[`remotes`](https://github.com/r-lib/remotes) package.

The installation may take some time as some system fonts need to be
catalogued to use the Microsoft Verdana font that USQ suggests. Once the
installation is complete, it should not be necessary to re-catalogue the
fonts, so loading ***`theme.usq`*** will not take any longer than
expected.

To install ***`theme.usq`*** copy and paste the code in the following
code block in your R session console.

``` r
if(!require(remotes)){
    install.packages("remotes")
    library(remotes)
}

install_github("adamhsparks/theme.usq",
               dependencies = TRUE,
               build_vignettes = TRUE)

library("ggplot2")
library("theme.usq")
```

### Keeping *theme.usq* up-to-date

Since ***`theme.usq`*** is still under development with bug fixes and
new features being added and it is not available from CRAN;
`update.packages()` will not update it. To keep ***`theme.usq`***
updated, use:

``` r
remotes::update_packages("theme.usq")
```

Examples of how to use `theme.usq` can be found in the vignette, *e.g.*,
`vignette("theme.usq")`.

## Meta

  - Please report any [issues or
    bugs](https://github.com/adamhsparks/theme.usq/issues).

  - License: MIT

  - Please note that this project is released with a [Contributor Code
    of Conduct](CONDUCT.md). By participating in this project you agree
    to abide by its terms.
