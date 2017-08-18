data <- data.table::fread("household_power_consumption.txt", na.strings=c("?"))
data <- tidyr::unite(data, date, Date:Time, sep = " ")
data$date <- lubridate::dmy_hms(data$date)
subset <- subset(data, date >= as.Date("2007-02-01") & date < as.Date("2007-02-03"))

png(filename = "plot4.R", width = 480, height = 480)
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))
with(subset, plot(date, Global_active_power, xlab = "", type = "l",
                  ylab = "Global Active Power"))
with(subset, plot(date, Voltage, xlab = "datetime", type = "l"))
with(subset, {
      plot(date, Sub_metering_1, type = "l", xlab = "",
           ylab = "Energy sub metering")
      lines(date, Sub_metering_2, col = "red")
      lines(date, Sub_metering_3, col = "blue")
})
legend("topright", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, lwd = 1)
with(subset, plot(date, Global_reactive_power, xlab = "datetime", type = "l"))
dev.off()
