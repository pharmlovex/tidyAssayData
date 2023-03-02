#' Data wrangling to ease differential gene expression workflow
#' @title Tidy assay data column names
#' @description In transcriptomics study, one of the objectives is to compare gene
#' expression between two or more groups in other to explore the molecular
#' mechanism that differentiates the groups. However, before performing differential
#' expression genes analysis on expression data, it is important to ensure that
#' the column names of the assay data is same with sample ID of the clinical or metadata.
#' Unfortunately, most count data obtained from raw unprocessed data have their column
#' names in a messy form.\cr
#'
#' This function therefore help to transform the assay data column names to suit
#' the sample name in the metadata. Thereby handling the daunting task of removing the attached
#' appendages and saving time to focus on what matters.
#'
#'
#'
#'
#'
#'
#' @param expMat A matrix data frame.
#' @param Sep The delimiter that joins the appendage to desired column name
#' @param nSep The count of the delimiter in the each column name.
#' @param pos The position of the desired column name in Assay column name
#'
#' @return A same matrix data frame, with desired column name.
#' @export
#' @import dplyr
#' @importFrom stringr str_split
#' @examples
#'
#' \dontrun{
#' library(tidyAssayData)
#' transformMatrixCol(Exprdata, Sep = ".", nSep = 2, pos = 2)
#' }
#'
#'
transformMatrixCol <- function(expMat, Sep, nSep, pos) {
  # Validate input parameters
  if(!is.data.frame(expMat)){
    stop(paste("Argument", deparse(substitute(expMat)), "must be a dataframe."))
  }
  if(!(Sep %in% c(".","-","_","|",";"))){
    stop(paste("Argument", deparse(substitute(Sep)), "must be a delimiter/seperator."))
  }
  if(nSep %% 1 != 0 | nSep <= 0){
    stop(paste("Argument", deparse(substitute(nSep)), "must be a positive integer."))
  }
  if(pos %% 1 != 0 | pos <= 0){
    stop(paste("Argument", deparse(substitute(pos)), "must be a positive integer."))

  }

  # Transform the colunm of the matrix
  assay.df <- expMat %>%
    colnames()  %>%
    str_split(paste0("[", Sep, "]"), n = (nSep + 1)) %>%
    unlist() %>%
    matrix(ncol = (nSep + 1), byrow = T) %>%
    as.data.frame()
  colnames(assay.df) <- LETTERS[1:(nSep + 1)]
  colnames(expMat) <- assay.df[, pos]
  rm(assay.df)
  return(expMat)
}


