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

)
