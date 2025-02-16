# Code adapted from the palmerpenguin package
# by Allison Horst, Alison Hill, and Kristen Gorman
# https://github.com/allisonhorst/palmerpenguins

# Use base R functions only

# penguins_raw ------------------------------------------------------------

# Download raw data
# Adelie penguin data from: https://doi.org/10.6073/pasta/abc50eed9138b75f54eaada0841b9b86
uri_adelie <- "https://portal.edirepository.org/nis/dataviewer?packageid=knb-lter-pal.219.3&entityid=002f3893385f710df69eeebe893144ff"

# Gentoo penguin data from: https://doi.org/10.6073/pasta/2b1cff60f81640f182433d23e68541ce
uri_gentoo <- "https://portal.edirepository.org/nis/dataviewer?packageid=knb-lter-pal.220.3&entityid=e03b43c924f226486f2f0ab6709d2381"

# Chinstrap penguin data from: https://doi.org/10.6073/pasta/409c808f8fc9899d02401bdb04580af7
uri_chinstrap <- "https://portal.edirepository.org/nis/dataviewer?packageid=knb-lter-pal.221.2&entityid=fe853aa8f7a59aa84cdd3197619ef462"

# Combining the URIs
uris <- c(uri_adelie, uri_gentoo, uri_chinstrap)

# Download data and combine into one dataframe
penguins_raw_list <- lapply(uris, read.csv) 
penguins_raw <- do.call(rbind, penguins_raw_list)

# Adjustments to make penguins_raw identical to palmerpenguins:::penguins_raw
penguins_raw$Sample.Number <- as.numeric(penguins_raw$Sample.Number)
penguins_raw$Date.Egg <- as.Date(penguins_raw$Date.Egg)
penguins_raw$Flipper.Length..mm. <- as.numeric(penguins_raw$Flipper.Length..mm.)
penguins_raw$Body.Mass..g. <- as.numeric(penguins_raw$Body.Mass..g.)
penguins_raw$Sex <- replace(penguins_raw$Sex, penguins_raw$Sex %in% c("", "."), NA)
penguins_raw$Comments <- replace(penguins_raw$Comments, penguins_raw$Comments == "", NA)

colnames(penguins_raw) <- c(
  "studyName", "Sample Number", "Species", "Region", "Island", "Stage",
  "Individual ID", "Clutch Completion", "Date Egg", "Culmen Length (mm)",
  "Culmen Depth (mm)", "Flipper Length (mm)", "Body Mass (g)", "Sex",
  "Delta 15 N (o/oo)", "Delta 13 C (o/oo)", "Comments"
)

# penguins ------------------------------------------------------------

penguins <- penguins_raw[, c("Species", "Island", 
			     "Culmen Length (mm)", "Culmen Depth (mm)", 
			     "Flipper Length (mm)", "Body Mass (g)", 
			     "Sex", "Date Egg")] 
# N.B. using some shorter colnames than in palmerpenguins::penguins
colnames(penguins) <- c(
	"species", "island", "bill_len", "bill_dep", "flipper_len",
	"body_mass", "sex", "year"
)
penguins$species <- regmatches(penguins$species,  
			       regexpr("^\\w+\\b", penguins$species))
penguins$species <- as.factor(penguins$species)
penguins$island <- as.factor(penguins$island)
penguins$flipper_len <- as.integer(penguins$flipper_len)
penguins$body_mass <- as.integer(penguins$body_mass)
penguins$sex <- tolower(penguins$sex)
penguins$sex <- as.factor(penguins$sex)
penguins$year <- regmatches(penguins$year,  
			    regexpr("\\d{4}", penguins$year))
penguins$year <- as.integer(penguins$year)

save(penguins_raw, penguins, file = "./data/penguins.rda")
