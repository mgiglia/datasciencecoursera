## datasciencecoursera
This repository was created for the Coursera JHU Data Science Specialization

##Contents:

cachematrix.R -- This program contains two functions: "makeCacheMatrix" and "cacheSolve."  makeCacheMatrix creates a special "matrix" object that can cache its inverse once calculated.  cacheSolve computes the inverse of the special "matrix" returned by first function and stores it back in the object for faster retrieval later.  If the cacheSolve function is called on the object a second time (i.e. after an inverse has been solved) the function returns the cached inverse immediately without requiring complex computations again.  Please note that this program assumes that the matrix evaluated has an inverse. The creation of this program was part of the second assignment for "R Programming."

complete.R - This function reads a directory to csv files by an id number and counts the number of complete observations are found in each file.  The result is stored in a data frame.  The creation of this program was part of the first assignment for "R Programming."
 
 corr.R -- A R function that reads a directory of CSV files containing data on pollutant's nitrate and sulfate in the air at various sits across the country and calculates the correlation between the two values for files that meet a minimum threshold of complete cases.  The resultant correlations are then stored in a vector for further analysis. (Requires complete.R) The creation of this program was part of the first assignment for "R Programming."

 polllantmean.R -- A R function that reads a directory of csv files containing data on nitrate and sulfate recorded at various locations across the country and calculates the means of a given pollutant at each of the sites and stores those means in a vector for further analysis.  The creation of this program was part of the first assignment for "R Programming."

 HelloWorld.md - a first example of a markdown file, created for the "Data Scientist's Toolbox"