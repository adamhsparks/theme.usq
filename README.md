<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Travis-CI Build Status](https://travis-ci.org/adamhsparks/theme_usq.svg?branch=master)](https://travis-ci.org/adamhsparks/theme_usq) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/adamhsparks/theme_usq?branch=master&svg=true)](https://ci.appveyor.com/project/adamhsparks/theme_usq) [![Coverage Status](https://img.shields.io/codecov/c/github/adamhsparks/theme_usq/master.svg)](https://codecov.io/github/adamhsparks/theme_usq?branch=master)

theme\_usq
==========

The goal of *theme\_usq* is to provide USQ staff and students with an easy to use *ggplot2* theme that conforms to the USQ visual guidelines for typography and colour.

Example
-------

``` r
library("ggplot2")
library("theme.usq")

p <- ggplot(mtcars) +
  geom_point(aes(
    x = wt,
    y = mpg,
    colour = factor(gear)
  )) +
  facet_wrap( ~ am)

p + theme_usq()
```

![](README-unnamed-chunk-2-1.png)

Code of Conduct
---------------

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
