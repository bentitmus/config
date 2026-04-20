if (interactive()) {
  if (!"pak" %in% utils::installed.packages()) utils::install.packages("pak")
}

update <- function() {
  pak::pkg_install("box")
  pak::pkg_install("tidyverse")
}

