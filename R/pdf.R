fig_aspect = 0.618
fig_w = 6
fig_h = fig_w * fig_aspect

#' @export
pdf_worksheet = function(
  fig_width = fig_w, fig_height = fig_h,
  fig_crop = TRUE, dev = "pdf", highlight = "pygments",
  template =  template_resources("pdf", "worksheet.tex"),
  latex_engine = "pdflatex",
  pandoc_args = NULL,
  ...
) {

  pandoc_args = c(pandoc_args,
                 paste0("--lua-filter=", template_resources("pdf", "replace_quotes.lua")),
                 paste0("--lua-filter=", template_resources("pdf", "wrap_verbatim.lua")),
                 "--variable", "fontsize=11pt",
                 "--variable", "geometry:margin=1in",
                 "--variable", paste0("rrlogo:", template_resources("pdf", "single-crane-logo-blackcoral.png")))

  # use the base pdf_document format
  format = rmarkdown::pdf_document(
    fig_width = fig_width, fig_height = fig_height, fig_crop = fig_crop,
    dev = dev, highlight = highlight, template = template,
    latex_engine = latex_engine, pandoc_args = pandoc_args,...
  )

  format$knitr$opts_chunk$class.output = "bg-success"
  format$knitr$opts_chunk$class.message = "bg-info"
  format$knitr$opts_chunk$class.warning = "bg-warning"
  format$knitr$opts_chunk$class.error = "bg-danger"

  format
}
