## datasciencecoursera
This repository was created for the Coursera JHU Data Science Specialization

##Contents:

#rankall.R
A R function that reads a CSV file containing hospital 30-day mortality rates for the metrics "heart attack", "heart failure" and "pneumonia," and returns a data frame containing the ith ranked hospital in each state (where lower mortality rates are preferred).  If the ith rank doesn't exist for a state, then NA is returned.  Entering "best" returns the top ranked hospitals in each state, and entering worst ranks the least well performing hospital in each state.  The creation of this program was part of the third assignment for "R Programming."

#rankhospital.R
A R function that reads a CSV file containing hospital 30-day mortality rates for the metrics "heart attack", "heart failure" and "pneumonia," and returns the ith ranked hospital for a given state.  If the ith ranked hospital doesn't exist for a given state, then NA is returned.  Instead of the ith rank, "best" may be entered to return the name of the best hospital for the state or "worst" may be entered to return the name of the worst hospital in the state by 30-day mortality rate. The creation of this program was part of the third assignment for "R Programming."

#best.R
A R function that reads a CSV file containing hospital 30-day mortality rates for the metrics "heart attack", "heart failure" and "pneumonia," and returns the name of the hospital with the lowest 30-day mortality rate for a given state. The creation of this program was part of the third assignment for "R Programming."

#cachematrix.R 
This program contains two functions: "makeCacheMatrix" and "cacheSolve."  makeCacheMatrix creates a special "matrix" object that can cache its inverse once calculated.  cacheSolve computes the inverse of the special "matrix" returned by first function and stores it back in the object for faster retrieval later.  If the cacheSolve function is called on the object a second time (i.e. after an inverse has been solved) the function returns the cached inverse immediately without requiring complex computations again.  Please note that this program assumes that the matrix evaluated has an inverse. The creation of this program was part of the second assignment for "R Programming."

#complete.R
This function reads a directory to csv files by an id number and counts the number of complete observations are found in each file.  The result is stored in a data frame.  The creation of this program was part of the first assignment for "R Programming."
 
#corr.R
 A R function that reads a directory of CSV files containing data on pollutant's nitrate and sulfate in the air at various sits across the country and calculates the correlation between the two values for files that meet a minimum threshold of complete cases.  The resultant correlations are then stored in a vector for further analysis. (Requires complete.R) The creation of this program was part of the first assignment for "R Programming."

#polllantmean.R
 A R function that reads a directory of csv files containing data on nitrate and sulfate recorded at various locations across the country and calculates the means of a given pollutant at each of the sites and stores those means in a vector for further analysis.  The creation of this program was part of the first assignment for "R Programming."

#HelloWorld.md
 A first example of a markdown file, created for the "Data Scientist's Toolbox"