
#' @importFrom methods getPackageName
template_resources = function(name, ...) {
  system.file('rmarkdown', 'templates', name, 'resources',
              ..., package = getPackageName())
}
