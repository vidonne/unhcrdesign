#' Use UNHCR Logo
#'
#' Returns location or data uri of a UNHCR logo
#'
#' @param logo Logo type
#' @param data_uri Logical.  Should a data uri be returned?
#'     If FALSE, file location is returned.
#' @export

use_unhcr_logo <- function(logo = c("blue", "white", "black"),
                           data_uri = FALSE) {
  logo <- match.arg(logo)
  logo <- paste0("unhcr_logo_", logo, ".svg")
  res <- system.file(paste0("resources/logo/", logo), package = "unhcrdesign")
  if (data_uri) {
    res <- knitr::image_uri(res)
  }
  res
}
