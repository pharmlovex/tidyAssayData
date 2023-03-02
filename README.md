
# tidyAssayData

A package that provides function that tidy assay data column names to suit clinical data for differential gene expression analysis. 
This is a duanting task we have to performing when working with a raw count data of a DNA microarray or RNA sequence data. These count data are usually presented with 
colunm names that have sample id attached with other appendages with help of a delimiter. This function therefore help to tidy the count data colunm names so it can be a true 
identifier for the samples in the study.


## Installation

Install tidyAssayData Package

```R
# Install devtools from CRAN
install.packages("devtools")

# Or install the development version from GitHub:

devtools::install_github("r-lib/devtools")

# load library
library(devtools)

devtools::install_github("pharmlovex/tidyAssayData")


```
    
## Usage/Examples

```R
# Load library
library(tidyAssayData)
library(dplyr)

# Load count data
df <- read.delim("counts.txt", sep = "", header = TRUE, row.names = 1,

                                comment.char = "#", dec = ".")

head(df)

# tidy the colunm names 

df_tidyColnames <- transformMatrixCol(df, Sep = ".", nSep=2, pos = 2)

head(df_tidyColnames)

```


## 🚀 About Me
I'm a bioinformatics developer...


## License

[MIT](https://choosealicense.com/licenses/mit/)


## Acknowledgements

 - [Awesome Readme Templates](https://awesomeopensource.com/project/elangosundar/awesome-README-templates)
 - [Awesome README](https://github.com/matiassingers/awesome-readme)
 - [How to write a Good readme](https://bulldogjob.com/news/449-how-to-write-a-good-readme-for-your-github-project)


## Badges


[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)



