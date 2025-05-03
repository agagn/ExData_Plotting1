# Reads data
df <- read.table(
    "data/household_power_consumption.txt",
    na.strings = "?",
    sep = ";",
    header = TRUE
)
# Filter data
df <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007", ]
# Convert datetime
df$Datetime <- as.POSIXct(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S")
# Create daily ticks
ticks <- seq(from = min(df$Datetime), to = round(max(df$Datetime), unit = "day"), by = "1 day")

## Draw Plot 2
Sys.setlocale("LC_TIME", "C")
png("plot3.png", width = 480, height = 480)
plot(
    df$Datetime,
    df$Sub_metering_1,
    type = "l",
    xlab = "",
    ylab = "Energy sub metering",
    xaxt = "n"
)
axis(1, at = ticks, labels = format(ticks, "%a"))
lines(
    df$Datetime,
    df$Sub_metering_2,
    type = "l",
    col = "red"
)
lines(
    df$Datetime,
    df$Sub_metering_3,
    type = "l",
    col = "blue"
)
legend(
    "topright",
    lty = 1,
    col = c("black", "red", "blue"),
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)
dev.off()
