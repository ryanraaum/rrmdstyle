html_worksheet <- function(...) {
  wrapped_html_document <- function(..., extra_dependencies = list()) {
    rmarkdown::html_document(
      ...,
      extra_dependencies = c(extra_dependencies, css_dependency("worksheet"))
    )
  }
  format <- wrapped_html_document(theme = NULL, ...)

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
