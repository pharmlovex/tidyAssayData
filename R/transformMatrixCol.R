#' Title
#' @title Tidy assay data column names
#' @description This function takes an assay data frame whose column names need
#' before analysis.
#' @param expMat A matrix data frame columns need to be cleaned.
#' @param Sep The delimiter that joins the appendage to desired column name
#' @param nSep The count of the delimiter in the each column name.
#' @param pos The position of the desired column name in Assay column name
#'
#' @return a data frame, with desired column name.
#' @export
#' @import dplyr
#' @importFrom stringr str_split
#' @examples
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
    stringr::str_split(paste0("[", Sep, "]"), n = (nSep + 1)) %>%
    unlist() %>%
    matrix(ncol = (nSep + 1), byrow = T) %>%
    as.data.frame()
  colnames(assay.df) <- LETTERS[1:(nSep + 1)]
  colnames(expMat) <- assay.df[, pos]
  rm(assay.df)
  return(expMat)
}


