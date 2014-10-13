## read file to data frame
df <- read.csv("./household_power_consumption.txt", sep = ";", na.strings = "?")

## select two days in the data set, date format dd/mm/yyyy
dates <- c("01/02/2007", "02/02/2007")

## sort data frame df first
filtered_df = NULL
filtered_df <- df[as.Date(df$Date, format="%d/%m/%Y") == as.Date(dates[1], format = "%d/%m/%Y"),]
filtered_df <- rbind(filtered_df, df[as.Date(df$Date, format="%d/%m/%Y") == as.Date(dates[2], format = "%d/%m/%Y"),])

## histgram plot
hist(filtered_df$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (killowwatts)", 
     ylab = "Frequency")

## save to png file
dev.copy(png, file = "plot1.png")
dev.off()