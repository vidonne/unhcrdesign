#' List available CSS files
#'
#' Print a list of available SCSS files included in unhcrdesign
#'
#' @export
#' @examples
#' \dontrun{
#' unhcr_scss_files()
#' }

unhcr_scss_files <- function() {
  scss_dir <- system.file("resources/scss", package = "unhcrdesign")
  scss_file_names <- list.files(scss_dir)
  scss_files <- list.files(scss_dir, full.names = TRUE)

  for (i in seq_along(scss_files)) {
    print(usethis::ui_field(scss_file_names[i]))
    con <- file(scss_files[i], "r")
    while (TRUE) {
      line <- readLines(con, n = 1)
      if (startsWith(line, "/*!")) {
        # Do nothing
      } else if (startsWith(line, "===============")) {
        break
      } else {
        print(usethis::ui_value(line))
      }
    }

    close(con)
  }

  invisible(gsub("\\.scss$", "", scss_file_names))
}
