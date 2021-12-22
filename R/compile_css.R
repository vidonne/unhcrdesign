#' Compile a scss file to a css output
#'
#' @param scss_file Character string of the scss file to use for compilation.
#' @param output_path Specifies the location of the output file.
#' @param output_style Bracketing and formatting style of the CSS output. Possible styles: "nested", "expanded", "compact", and "compressed".
#'
#' @return
#' @export
#'
#' @examples
#' \dontrun{
#' compile_css("scss/html_document.scss", "inst/resources/css/bootstrap.css", "compressed")
#' }
compile_css <- function(scss_file, output_path, output_style = "compressed") {
  sass::sass(
    sass::sass_file(scss_file),
    output = output_path,
    options = sass::sass_options(output_style = output_style)
  )
}
