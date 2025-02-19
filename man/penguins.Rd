\name{penguins}
\encoding{UTF-8}
\docType{data}
\title{Size Measurements for Penguins near Palmer Station, Antarctica}
\alias{penguins}
\alias{penguins_raw}
\description{
  Data on adult penguins covering three species found on three islands in the 
  Palmer Archipelago, Antarctica, including their size 
  (flipper length, body mass, bill dimensions), and sex.

  The columns of \code{penguins} are a subset of the more extensive
  \code{penguins_raw} data frame which results from reading the original
  data, containing only numeric, character and \code{\link{Date}} variables.
  \code{penguins_raw} includes nesting observations and blood isotope data.
}
\usage{
penguins
penguins_raw
}
\format{
  \code{penguins} is a data frame with 344 rows and 8 variables:
  \describe{
    \item{\code{species}}{\code{\link{factor}}, penguin species with levels \code{Adelie} \code{Chinstrap} \code{Gentoo}}
    \item{\code{island}}{factor, island in Palmer Archipelago, Antarctica, with levels \code{Biscoe} \code{Dream} \code{Torgersen})}
    \item{\code{bill_len}, \code{bill_dep}}{\code{\link{numeric}}, bill length and depth (millimeters)}
    \item{\code{flipper_len}}{\code{\link{integer}}, flipper length (millimeters)}
    \item{\code{body_mass}}{integer, body mass (grams)}
    \item{\code{sex}}{factor, sex with levels \code{female} \code{male}}
    \item{\code{year}}{integer, study year (2007, 2008, or 2009)}
  }

  \code{penguins_raw} is a data frame with 344 rows and 17 variables.

  8 columns correspond to columns in \code{penguins}, though with different variable names
  and/or classes:
  \describe{
    \item{\code{Species}}{character}
    \item{\code{Island}}{character}
    \item{\code{Culmen Length (mm)}, \code{Culmen Depth (mm)}}{numeric, bill length and depth}
    \item{\code{Flipper Length (mm)}}{numeric, flipper length}
    \item{\code{Body Mass (g)}}{numeric, body mass}
    \item{\code{Sex}}{character}
    \item{\code{Date Egg}}{\code{\link{Date}}, when study nest observed with 1 egg.
      The year component is the \code{year} column in \code{penguins}}
  }

  There are 9 further columns:
  \describe{
    \item{\code{studyName}}{character, the sampling expedition
      from which data were collected, generated, etc.}
    \item{\code{Sample Number}}{numeric, continuous numbering sequence for each sample}
    \item{\code{Region}}{character, the region of Palmer LTER sampling grid}
    \item{\code{Stage}}{character, denoting reproductive stage at sampling}
    \item{\code{Individual ID}}{character, unique ID for each individual in dataset}
    \item{\code{Clutch Completion}}{character, if the study nest was observed with a full clutch, 
      i.e., 2 eggs}
    \item{\code{Delta 15 N (o/oo)}, \code{Delta 13 C (o/oo)}}{numeric, 
      the measure of the ratio of stable isotopes 15N:14N and 13C:12C}
    \item{\code{Comments}}{character, additional relevant information}
  }
}
\source{
  \describe{
    \item{\enc{Adélie}{Adelie} penguins:}{Palmer Station Antarctica LTER and K. Gorman (2020).
      Structural size measurements and isotopic signatures of foraging
      among adult male and female \enc{Adélie}{Adelie} penguins (Pygoscelis adeliae)
      nesting along the Palmer Archipelago near Palmer Station, 2007-2009
      ver 5. Environmental Data Initiative, \doi{10.6073/pasta/98b16d7d563f265cb52372c8ca99e60f}.}

    \item{Gentoo penguins:}{Palmer Station Antarctica LTER and K. Gorman (2020).
      \doi{10.6073/pasta/7fca67fb28d56ee2ffa3d9370ebda689}.}

    \item{Chinstrap penguins:}{Palmer Station Antarctica LTER and K. Gorman (2020).
      \doi{10.6073/pasta/c14dfcfada8ea13a17536e73eb6fbe9e}.}
  }

  The title naming convention for the source for the Gentoo and Chinstrap
  data is that same as for \enc{Adélie}{Adelie} penguins.
}
\references{
  Gorman, K. B., Williams, T. D. and Fraser, W. R. (2014)
  Ecological Sexual Dimorphism and Environmental Variability within a
  Community of Antarctic Penguins (Genus Pygoscelis).
  \emph{PLoS ONE} \bold{9}, 3, e90081; \doi{10.1371/journal.pone.0090081}.

  Horst, A. M., Hill, A. P. and Gorman, K. B. (2022) 
  Palmer Archipelago Penguins Data in the palmerpenguins R Package 
  - An Alternative to Anderson's Irises.
  \emph{R Journal} \bold{14}, 1; \doi{10.32614/RJ-2022-020}.

  Kaye, E., Turner, H., Gorman, K. B., Horst, A. M. and Hill, A. P. (2025)
  Preparing the Palmer Penguins data for the datasets package in R. 
  \doi{DOI}.
}
\note{
  This data is also available in the \CRANpkg{palmerpenguins} package.  See
  also \url{https://allisonhorst.github.io/palmerpenguins/} for further
  details and resources.

  This version of the data uses some shorter variable names, 
  for compact data display. 

  \bibcite{Kaye \abbr{et al.}\sspace(2025)} provides the scripts used to create
  these data sets from the original source data, 
  and a notebook reproducing results from \bibcite{Gorman \abbr{et al.}\sspace(2014)}.
}
\examples{
## look at them a bit
str(penguins)
summary(penguins)
str(penguins_raw)
## not really useful b/c of the many character ones:
summary(penguins_raw)
## make it interesting by "factorizing" the data frame:
dFactor <- function(dat) { dat[] <- lapply(dat, \(.)
if(is.character(.)) as.factor(.) else .); dat }
summary(dFactor(penguins_raw))

mosaicplot( ~ species + island,       data = penguins)
mosaicplot( ~ species + island + sex, data = penguins)

op <- options(width = max(107, getOption("width")))
symnum(is.na(penguins),     symbols = c(".", "N"), abbr.colnames = 7)
symnum(is.na(penguins_raw), symbols = c(".", "N"), abbr.colnames = 5)

## Produce the long variable names as from {palmerpenguins} pkg:
long_nms <- sub("len", "length_mm",
               sub("dep","depth_mm",
                   sub("mass", "mass_g", colnames(penguins))))
## compare long and short names:
noquote(rbind(long_nms, nms = colnames(penguins)))

\dontrun{ # << not in this example, keeping shorter 'penguins' names:
    colnames(penguins) <- long_nms
}
}
\keyword{datasets}
