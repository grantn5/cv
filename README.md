# Curriculum vitae

A repo used to create my CV with [R Markdown](https://rmarkdown.rstudio.com) and [pagedown](https://pagedown.rbind.io). Run `render_cv.r` to build `docs/cv.html` and `docs/cv.pdf`.

## Making a tailored CV

- `data/entries.csv` has one row per role, education or article, identified by `entry_id`. Set `include` to `TRUE`/`FALSE` to show or hide the whole entry.
- `data/bullets.csv` is the pool of bullet points, one per row, linked to an entry by `entry_id`. Set `include` to `TRUE` for the bullets you want; included bullets are printed in `order` within their entry.
- `data/text_blocks.csv` holds the intros. Add an `intro_<job>` row for each tailored intro.

To tailor the CV for a job:

1. Switch bullets on or off with `include` and renumber `order`, adding new bullets to the pool if needed.
2. Add an intro row to `data/text_blocks.csv`, or reuse an existing one.
3. Set `intro` at the top of `render_cv.r` to that label and run it. Rendering stops with an error if the label isn't in `text_blocks.csv`.
