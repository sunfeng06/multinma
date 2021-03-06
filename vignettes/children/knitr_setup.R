knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  dev.args = list(type = "cairo-png", antialias = "subpixel"),
  fig.width = 6,
  fig.height = 4.5,
  fig.align = "center"
)
options(width = 100)

# Write vignette details to asis file for precompiled vignettes
if (!rlang::has_name(rmarkdown::metadata, "vignette")) {
  .asis <- paste0(gsub("\\.Rmd$", "", knitr::current_input()), ".html.asis")
  file.create(.asis)
  cat(
    paste0("%\\VignetteIndexEntry{", rmarkdown::metadata$title, "}"),
    "%\\VignetteEngine{R.rsp::asis}",
    "%\\VignetteEncoding{UTF-8}",
    sep = "\n",
    file = .asis)
}
