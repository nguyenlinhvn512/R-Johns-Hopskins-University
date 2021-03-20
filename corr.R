corr <- function(directory, threshold = 0){
  complete_cases <- complete(directory)
  nice <- complete_cases[complete(directory)$nobs > threshold,]
  cor_results <- numeric(0)
  
  for (i in nice$id){
    if (i<10){
      filename <- paste0(directory,"/","00",as.character(i),".csv")
    } else if (i<100){
      filename <- paste0(directory,"/","0",as.character(i),".csv")
    } else {
      filename <- paste0(directory,"/",as.character(i),".csv")
    }
    data <- read.csv(filename)
    complete_data <- data[!is.na(data$sulfate) & !is.na(data$nitrate),]
    corre <- cor(complete_data$sulfate,complete_data$nitrate)
    cor_results <- c(cor_results, corre)
  }
  cor_results
}