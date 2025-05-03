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
png("plot2.png", width = 480, height = 480)
plot(
    df$Datetime,
    df$Global_active_power,
    type = "l",
    xlab = "",
    ylab = "Global Active Power(Kilowatts)",
    xaxt = "n"
)
axis(1, at = ticks, labels = format(ticks, "%a"))

dev.off()
