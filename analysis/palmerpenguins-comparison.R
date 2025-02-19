# created in "./data-raw/penguins.R"
load("./data/penguins.rda")

# penguins_raw -----------------------------------------------------------

# our version is a data.frame, so get data.frame version from palmerpenguins
# if tibble installed locally, palmerpenguins::penguins_raw defaults to tbl_df
pp_penguins_raw <- palmerpenguins:::penguins_raw_df
attr(pp_penguins_raw, "spec") <- NULL
identical(penguins_raw, pp_penguins_raw) # TRUE
all.equal(
  tibble::as_tibble(penguins_raw), 
  palmerpenguins::penguins_raw, 
  check.attributes = FALSE
)

# penguins ---------------------------------------------------------------

# We're using shorter names, so to check data is identical, 
# put revert to palmerpenguins::penguins colnames
long_nms <- sub("len", "length_mm",
               sub("dep","depth_mm",
                   sub("mass", "mass_g", colnames(penguins))))

# compare colnames
noquote(rbind(long_nms, nms = colnames(penguins)))

colnames(penguins) <- long_nms
identical(penguins, palmerpenguins:::penguins_df) # TRUE
