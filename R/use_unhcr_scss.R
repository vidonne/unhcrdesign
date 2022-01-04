#' SCSS file location
#'
#' Returns the location of scss file(s)
#' @param scss_file Name of scss file to retrieve
#' @export
#'
use_unhcr_scss <- function(scss_file) {
  scss_file <- gsub("\\.scss$", "", scss_file)
  files <- c()
  for (file in scss_file) {
    loc <- system.file(paste0("resources/scss/", file, ".scss"),
                       package = "unhcrdesign")
    if (loc == "") {
      usethis::ui_warn("{usethis::ui_path(paste0(file, '.scss'))}
                       not available")
      usethis::ui_info('For a complete list of scss files, run
                       {usethis::ui_code("unhcr_scss_files()")}')
    } else {
      files <- c(files, loc)
    }
  }
  files
}
