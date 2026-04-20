wq <- function()
  q(save="yes")

local({r <- getOption("repos")
  r["CRAN"] <- "https://cran.ma.imperial.ac.uk/"
  options(repos=r)
})

options(stringsAsFactors=FALSE)

.Last <- function()
  if (interactive()) try(savehistory(Sys.getenv("R_HISTFILE")))

source("~/.config/R/packages.r")

