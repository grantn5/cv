# This script builds both the HTML and PDF versions of your CV

# Which intro text block from data/text_blocks.csv to use (the `loc` column)
intro <- "intro_cv"

# Knit the HTML version
rmarkdown::render(
  here::here("cv.rmd"),
  params = list(pdf_mode = FALSE, intro = intro),
  output_file = here::here("docs/cv.html")
)

# Knit the PDF version to temporary html location
tmp_html_cv_loc <- fs::file_temp(ext = ".html")
rmarkdown::render(
  here::here("cv.rmd"),
  params = list(pdf_mode = TRUE, intro = intro),
  output_file = tmp_html_cv_loc
)

# Convert to PDF using Pagedown
pagedown::chrome_print(
  input = tmp_html_cv_loc,
  output = here::here("docs/cv.pdf")
)
