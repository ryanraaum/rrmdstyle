
# fig_aspect <- 0.618
# fig_w <- 6
# fig_h <- fig_w * fig_aspect

#' PDF formats for literate, interactive R Markdown documents
#'
#' These formats are for PDF versions of worksheets and assignments used in
#' my Quantitative Methods in Biological Anthropology course.
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ...
#' See other arguments in the documentation for [rmarkdown::pdf_document()]
#' (note that you cannot use the \code{template} argument in either
#' \code{pdf_worksheet} or \code{pdf_assignment} becaues it is set
#' internally).
#' @section Details: You can find more details about each output format below.
#' @name pdf_worksheet
#' @rdname rr_pdf
NULL

#' @section `pdf_worksheet`: Format for creating a worksheet including fancy
#' page headers and logo on the first page.
#' @return An R Markdown output format.
#' @export
#' @rdname rr_pdf
pdf_worksheet <- function(
  fig_width = 6,
  fig_height = 3.7,
  ...
) {
  rr_pdf("worksheet",
         fig_width = fig_width,
         fig_height = fig_height,
         ...)
}

#' @section `pdf_assignment`: Format for creating a minimally styled
#' assignment document.
#' @export
#' @rdname rr_pdf
pdf_assignment <- function(...) {
  rr_pdf("assignment",...)
}


rr_pdf <- function(
  doctype = c("worksheet", "assignment"),
  fig_width = 6.5,
  fig_height = 4.5,
  highlight = "default",
  template = "default",
  df_print = "default",
  pandoc_args = NULL,
  ...
) {
  doctype <- match.arg(doctype)

  if (identical(highlight, "default")) highlight <- "pygments"

  if (identical(df_print, "default")) df_print <- "tibble"

  if (identical(template, "default")) {
    template <- template_resources("pdf", "pdf_template.tex")
  } else {
    stop("User template not supported.")
  }

  pandoc_args <- c(pandoc_args,
                 paste0("--lua-filter=", template_resources("pdf", "replace_quotes.lua")),
                 paste0("--lua-filter=", template_resources("pdf", "wrap_verbatim.lua")),
                 "--variable", "fontsize=11pt",
                 "--variable", "geometry:margin=1in")

  if (identical(doctype, "worksheet")) {
    pandoc_args <- c(pandoc_args,
                     "--variable",
                     paste0("rrlogo:", template_resources("pdf", "single-crane-logo-blackcoral.png")),
                     "--variable", "rrworksheet")
  } else if (identical(doctype, "assignment")) {
    pandoc_args <- c(pandoc_args, "--variable", "rrassignment")
  }

  # use the base pdf_document format
  format <- rmarkdown::pdf_document(
    fig_width = fig_width,
    fig_height = fig_height,
    highlight = highlight,
    template = template,
    df_print = df_print,
    pandoc_args = pandoc_args,
    ...
  )

  format$knitr$opts_chunk$class.output <- "bg-success"
  format$knitr$opts_chunk$class.message <- "bg-info"
  format$knitr$opts_chunk$class.warning <- "bg-warning"
  format$knitr$opts_chunk$class.error <- "bg-danger"

  format
}
