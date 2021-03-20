data <- read.csv("hw1_data.csv")

colnames(data)

data[1:2,]
head(data,n=2)

nrow(data)
tail(data, n=2)

data[47, "Ozone"]

sum(is.na(data$Ozone))

# My try
bad <- is.na(data$Ozone)
print(mean(data$Ozone[!bad]))

# Fastest
mean(data$Ozone, na.rm = TRUE)

cond <- data[data$Ozone > 31 & data$Temp > 90,]
mean(cond$Solar.R, na.rm = TRUE)

cond2 <- data[data$Month == 6,]
mean(cond2$Temp)

max(data[data$Month == 5,]$Ozone, na.rm = TRUE)
