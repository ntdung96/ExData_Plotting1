data <- data.table::fread("household_power_consumption.txt", na.strings=c("?"))
data <- tidyr::unite(data, date, Date:Time, sep = " ")
data$date <- lubridate::dmy_hms(data$date)
subset <- subset(data, date >= as.Date("2007-02-01") & date < as.Date("2007-02-03"))
hist(subset$Global_active_power, main = "Global Active Power",
     col = "red", xlab = "Global Active Power (kilowatts)")