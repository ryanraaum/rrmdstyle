fig_aspect <- 0.618
fig_w <- 6
fig_h <- fig_w * fig_aspect

#' @export
pdf_worksheet <- function(
  fig_width = fig_w,
  fig_height = fig_h,
  ...
) {
  rr_pdf("worksheet",
         fig_width = fig_width,
         fig_height = fig_height,
         ...)
}

#' @export
pdf_assignment <- function(...) {
  rr_pdf("assignment",...)
}


rr_pdf <- function(
  doctype = c("worksheet", "assignment"),
  fig_width = 6.5,
  fig_height = 4.5,
  highlight = "default",
  template = "default",
  pandoc_args = NULL,
  ...
) {
  doctype <- match.arg(doctype)

  if (identical(highlight, "default")) highlight <- "pygments"

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
    pandoc_args = pandoc_args,
    ...
  )

  format$knitr$opts_chunk$class.output <- "bg-success"
  format$knitr$opts_chunk$class.message <- "bg-info"
  format$knitr$opts_chunk$class.warning <- "bg-warning"
  format$knitr$opts_chunk$class.error <- "bg-danger"

  format
}
