## read file to data frame
df <- read.csv("./household_power_consumption.txt", sep = ";", na.strings = "?")

## select two days in the data set, date format dd/mm/yyyy
dates <- seq(dmy("01/02/2007"), dmy("02/02/2007"), 86400)

## sort data frame df first
filtered_df = NULL
filtered_df <- df[as.Date(df$Date, format="%d/%m/%Y") == as.Date(dates[1], format = "%d/%m/%Y"),]
filtered_df <- rbind(filtered_df, df[as.Date(df$Date, format="%d/%m/%Y") == as.Date(dates[2], format = "%d/%m/%Y"),])

## use transform to add a weekday column to filtered_df 
df2 <- transform(filtered_df, WeekDay = weekdays(as.Date(Date,format("%d/%m/%Y"))))

## line plot
plot(df2$Sub_metering_1, col = "black", type = "l", xaxt = "n",
     ylab = "Global Active Power (killowwatts)", xlab = "")
axis(side = 1, c("Thu","Fri","Sat"), at = c(1,length(df2$WeekDay)/2, length(df2$WeekDay)))
lines(df2$Sub_metering_2, col = "red")
lines(df2$Sub_metering_3, col = "blue")

legend(1780, 40, c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1), lwd = c(1, 1, 1), 
       col = c("black", "red", "blue"))

## save to png file
dev.copy(png, file = "plot3.png")
dev.off()