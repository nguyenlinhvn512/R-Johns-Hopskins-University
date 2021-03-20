pollutantmean <- function(directory, pollutant,id = 1:332){
  sum_pollutant <- 0
  num_pollutant <- 0
  for (i in id){
    if (i<10){
      filename <- paste0(directory,"/","00",as.character(i),".csv")
    } else if (i<100){
      filename <- paste0(directory,"/","0",as.character(i),".csv")
    } else {
      filename <- paste0(directory,"/",as.character(i),".csv")
    }
    data <- read.csv(filename)
    comp_data <- data[!is.na(data[[pollutant]]),]
    sum_pollutant <- sum_pollutant + sum(comp_data[[pollutant]])
    num_pollutant <- num_pollutant + nrow(comp_data)
  }
  sum_pollutant/num_pollutant
}

