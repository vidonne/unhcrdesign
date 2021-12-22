#' CSS file location
#'
#' Returns the location of css file(s)
#' @param css_file Name of css file to retrieve
#' @export
#'
use_unhcr_css <- function(css_file) {
  css_file <- gsub("\\.css$", "", css_file)
  files <- c()
  for (file in css_file) {
    loc <- system.file(paste0("resources/css/", file, ".css"),
                       package = "unhcrdesign")
    if (loc == "") {
      usethis::ui_warn("{usethis::ui_path(paste0(file, '.css'))}
                       not available")
      usethis::ui_info('For a complete list of css files, run
                       {usethis::ui_code("mayo_css_files()")}')
    } else {
      files <- c(files, loc)
    }
  }
  files
}
