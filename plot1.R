# Reads data
df <- read.table(
    "data/household_power_consumption.txt",
    na.strings = "?",
    sep = ";",
    header = TRUE
)
# Filter data
df <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007", ]

## Draw plot 1
png("plot1.png", width = 480, height = 480)
hist(
    df$Global_active_power,
    main = "Global Active Power",
    xlab = "Global Active Power (kilowatts)",
    ylab = "Frequency",
    col = "Red"
)
dev.off()
