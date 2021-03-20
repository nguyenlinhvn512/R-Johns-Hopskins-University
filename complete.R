complete <- function(directory,id = 1:332){
  results <- data.frame(id=numeric(0), nobs=numeric(0))
  for (i in id){
    if (i<10){
      filename <- paste0(directory,"/","00",as.character(i),".csv")
    } else if (i<100){
      filename <- paste0(directory,"/","0",as.character(i),".csv")
    } else {
      filename <- paste0(directory,"/",as.character(i),".csv")
    }
    data <- read.csv(filename)
    complete_data <- data[!is.na(data$sulfate) & !is.na(data$nitrate),]
    results <- rbind(results, data.frame(id=i, nobs=nrow(complete_data)))
  }
  results
}