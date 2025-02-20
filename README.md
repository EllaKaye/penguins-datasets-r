# Preparing the Palmer Penguins Data for the *datasets* Package in R

The `penguins` and `penguins_raw` datasets in the [palmerpenguins R package](https://allisonhorst.github.io/palmerpenguins/) have become popular for data exploration and visualisation, particularly in an educational context.

With a view to adding these to the **datasets** package that is included in the base R distribution, 
this project contains the following:

- `"./data-raw/penguins.R"`: a script to create `penguins` and `penguins_raw`, 
from the data made available through the [Environmental Data Initiative](https://edirepository.org).
- `"./data/penguins.rda"`: the data file created from running "./data-raw/penguins.R"
- `"./man/penguins.Rd"`: A documentation file for the `penguins` and `penguins_raw` datasets
- `"./analysis/palmerpenguins-comparison.R"`: A script comparing our versions of `penguins` and `penguins_raw` with those in the palmerpenguins package.
- `"./analysis/Gorman_2014_reproduction.Rmd"`: A computational notebook reproducing Tables 1 and 2 from Gorman *et. al.* (2014)
- `"./analysis/Gorman_2014_reproduction.html"`: The result of rendering the above-mentioned notebook to html

The repo is uploaded to Zenodo, with DOI [10.5281/zenodo.14902740](https://doi.org/10.5281/zenodo.7681382), and referenced in `penguins.Rd`.

The data was originally published in Gorman et al. (2014). 
Their inclusion in the **datasets** package included in the base R distribution 
was motivated by Horst et al. (2022).

## References

Gorman, K. B., Williams, T. D., Fraser, W. R. (2014)
Ecological sexual dimorphism and environmental variability within a community of Antarctic penguins (genus *Pygoscelis*). 
PLoS ONE 9(3):e90081. <https://doi.org/10.1371/journal.pone.0090081>

Horst, A. M., Hill, A. P. and Gorman, K. B. (2022) 
Palmer Archipelago Penguins Data in the palmerpenguins R Package - An Alternative to Anderson's Irises.
R Journal, 14(10). <https://doi.org/10.32614/RJ-2022-020>.
