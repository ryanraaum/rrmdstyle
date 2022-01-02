fig_aspect = 0.618
fig_w = 6
fig_h = fig_w * fig_aspect

#' @importFrom bslib bs_theme font_google
#' @export
html_worksheet <- function(...) {
  wrapped_html_document <- function(..., theme = theme, extra_dependencies = list()) {
    rmarkdown::html_document(
      ...,
      theme = bs_theme(version = 5,
                       base_font = font_google("Roboto"),
                       code_font = font_google("Source Code Pro"),
                       heading_font = font_google("Roboto"),
                       "font-size-base" = "1rem",
                       "h1-font-size" = "$font-size-base * 1.3",
                       "h2-font-size" = "$font-size-base * 1.2",
                       "h3-font-size" = "$font-size-base * 1.1",
                       "h4-font-size" = "$font-size-base * 1.1",
                       "code-font-size" = "0.9rem",
                       "table-cell-padding-x" = "0.5rem",
                       "table-cell-padding-y" = "0.25rem",
                       "light" = "#F4F4F6",
                       "dark" = "#5D6477"),
      extra_dependencies = c(extra_dependencies, css_dependency("worksheet")),
      includes = rmarkdown::includes(before_body=logo_header_path()),
      df_print = "tibble",
      highlight = "pygments"
    )
  }
  format <- wrapped_html_document(theme = NULL, ...)

  format$knitr$opts_chunk$class.output = "bg-success text-dark bg-opacity-10"
  format$knitr$opts_chunk$class.message = "bg-info text-dark bg-opacity-10"
  format$knitr$opts_chunk$class.warning = "bg-warning text-dark bg-opacity-10"
  format$knitr$opts_chunk$class.error = "bg-danger text-dark bg-opacity-10"
  format$knitr$opts_chunk$fig.align = "center"
  format$knitr$opts_chunk$fig.width = fig_w
  format$knitr$opts_chunk$fig.height = fig_h
  format$knitr$opts_chunk$out.width = "80%"
  format$knitr$opts_chunk$error = TRUE

  format
}

#' Create CSS HTML dependency
#'
#' @param css_names Base names of CSS files to include, "common" always included
#'
#' @return An object that can be included in a list of dependencies passed to attachDependencies.
#'
#' @importFrom htmltools htmlDependency
#' @importFrom methods getPackageName
#' @importFrom utils packageVersion
css_dependency <- function(css_names=NULL) {
  list(htmlDependency(
    name = sprintf("%s-css", getPackageName()),
    version = packageVersion(getPackageName()),
    src = template_resources("html"),
    stylesheet = c(sprintf("%s.css", css_names), "common.css")
  )
  )
}

logo_header_path <- function() {
  template_resources("html", "worksheet_header.html")
}
