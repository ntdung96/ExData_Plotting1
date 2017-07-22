data <- data.table::fread("household_power_consumption.txt", na.strings=c("?"))
data <- tidyr::unite(data, date, Date:Time, sep = " ")
data$date <- lubridate::dmy_hms(data$date)
subset <- subset(data, date >= as.Date("2007-02-01") & date < as.Date("2007-02-03"))

png(filename = "plot2.R", width = 480, height = 480)
with(subset, plot(date, Global_active_power, xlab = "", type = "l",
                  ylab = "Global Active Power (kilowatts)"))
devoff()