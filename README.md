
# rrmdstyle

<!-- badges: start -->
<!-- badges: end -->

The **rrmdstyle** package provides custom [R Markdown](https://rmarkdown.rstudio.com) HTML and PDF/LaTeX formats that I use for literate, interactive worksheets and assignments in my *Quantitative Methods in Biological Anthropology* course that I teach at the CUNY Graduate Center. 

## Installation

This package is too niche to ever be on [CRAN](https://CRAN.R-project.org), so install from github with:

``` r
remotes::install_github("ryanraaum/rrmdstyle")
```

## Usage

There are two different document types:

1. A more aggressively styled worksheet document with matching HTML and PDF/LaTeX formatters (`html_worksheet` and `pdf_worksheet`).
2. A more basically styled assignment document with only a PDF/LaTeX formatter (`pdf_assignment`).

To use any of these, assign to `output` in the R Markdown YAML header. For example,

```yaml
---
title: "Worksheet"
subtitle: "Course Name"
author: "Ryan Raaum"
output: rrmdstyle::pdf_worksheet
---
```

Almost all of the arguments for either `rmarkdown::pdf_document()` or `rmarkdown::html_document()` can be used as appropriate, but I don't expect my students to use them. (One main reason for this package was so I could have simple, clean YAML headers in my worksheet and assignment documents.)

## Credit to

- [rstudio/tufte](https://github.com/rstudio/tufte) for inspiration on how to wrap the `rmarkdown::pdf_document`/`rmarkdown::html_document` functions and file layout.
- [rstudio/rticles](https://github.com/rstudio/rticles) for general inspiration.
- [rstudio/bslib](https://github.com/rstudio/bslib) for the excellent `bs_theme` allowing for easy customization of [Bootstrap](https://getbootstrap.com) themes in R.
- [Modifying R Markdown's LaTeX styles](https://www.gerkelab.com/blog/2019/04/manipulating-latex-in-rmd/) by Travis Gerke for convincing me that it shouldn't be too hard.
- [Wandmalfarbe/pandoc-latex-template](https://github.com/Wandmalfarbe/pandoc-latex-template) for an example of a good way to modify the stock pandoc template. 

