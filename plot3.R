data <- data.table::fread("household_power_consumption.txt", na.strings=c("?"))
data <- tidyr::unite(data, date, Date:Time, sep = " ")
data$date <- lubridate::dmy_hms(data$date)
subset <- subset(data, date >= as.Date("2007-02-01") & date < as.Date("2007-02-03"))
with(subset, {
      plot(date, Sub_metering_1, type = "l", xlab = "",
           ylab = "Energy sub metering")
      lines(date, Sub_metering_2, col = "red")
      lines(date, Sub_metering_3, col = "blue")
})
legend("topright", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, lwd = 1)