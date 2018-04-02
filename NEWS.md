
# theme.usq 1.0.0

## Major changes

* Add new palettes to the package for `primary`, `cool`, `warm`, `bright` and
`digital`

* Revamp package functionality to make it easier to use by specifying colour
names rather than using numbers to index the values

* Add new functions `scale_fill_usq()` and `scale_colour_usq()` for use with
_ggplot2_ graphics for easier USQ colours

* Add support for USQ "digital colours" palette

* Change arguments in the base plotting functions for colours. Colours now
simply specified by `col = "usq charcoal"` in the function call

* Ribbon colours for facets are Dark Gray Warm, not USQ Yellow, with bold, white
font face

## Bug fixes

* Fix ORCID entry in author field of DESCRIPTION

## Deprecated

* ` usq_fill_gradient_warm()` and ` usq_fill_gradient_cool`; superceded by,
`scale_fill_usq("warm")` or `scale_fill_usq("cool")`

--------------------------------------------------------------------------------

# theme.usq 0.1.1

## Bug fixes

* Implement changes to pass travis and appveyor CI

* Implement changes to pass CRAN WIN Builder checks

## Minor changes

* Check for OS, then check if Verdana has been imported. If not import. Check
again, if not, import recursively

# theme.usq 0.1.0

## Major changes

* Add base plot options in addition to _ggplot2_
  
  * `plot_usq()`
  
  * `hist_usq()`
  
  * `boxplot_usq()`
  
  * `barplot_usq()`
  
### Minor enhancements

* Use col for `hist_usq()` border colour to match _ggplot2_ style

### Bug fixes

* Fix issue with base graphics font on Windows

## Minor changes

* _ggplot2_ is moved to "imports" since base graphing capabilities are now
included, the package does not strictly rely on _ggplot2_ alone now

--------------------------------------------------------------------------------

# theme.usq 0.0.4

* Now works with most recent version of `ggplot2` on CRAN, 2.2.1 as of
30/09/2017

* Enhanced documentation

--------------------------------------------------------------------------------

# theme.usq 0.0.3

* Tidy up documentation

* Update minimum version of R to >= 3.1

* Add minimum version of ggplot2  (>= 2.2.1.9000)

--------------------------------------------------------------------------------

# theme.usq 0.0.2

* Add `scale_fill_gradient()` to compliment `scale_colour_gradient()`

* Add new cool gradient colour option

* Make warm gradient colours more distinct

--------------------------------------------------------------------------------

# theme.usq 0.0.1

* First release

# theme.usq 0.0.0.9000

* Added a `NEWS.md` file to track changes to the package.
