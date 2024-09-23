# Load necessary libraries
library(ggplot2)
library(reshape2)

# Create the dataset
data <- data.frame(
  Date = as.Date(c("2024-01-01", "2024-01-02", "2024-01-03", "2024-01-04", "2024-01-05", "2024-01-06")),
  Station_A_Temperature = c(25.0, 24.5, 26.2, 23.8, 25.5, 23.0),
  Station_A_Precipitation = c(0.1, 0.0, 0.3, 0.2, 0.1, 0.4),
  Station_B_Temperature = c(23.5, 22.8, 25.0, 22.5, 24.5, 21.8),
  Station_B_Precipitation = c(0.2, 0.3, 0.1, 0.0, 0.4, 0.2)
)

# Melt the dataset for plotting
melted_data <- melt(data, id.vars = "Date")

# Create a time series plot
ggplot(melted_data, aes(x = Date, y = value, color = variable, group = variable)) +
  geom_line() +
  labs(title = "Time Series Plot of Temperature and Precipitation", x = "Date", y = "Value") +
  theme_minimal()
# Line plot of temperature over time
ggplot(data, aes(x = Date)) +
  geom_line(aes(y = Station_A_Temperature, color = "Station A Temperature")) +
  geom_line(aes(y = Station_B_Temperature, color = "Station B Temperature")) +
  labs(title = "Line Plot of Temperature", x = "Date", y = "Temperature (°C)") +
  scale_color_manual(values = c("blue", "red")) +
  theme_minimal()
# Melt the dataset for precipitation only
precipitation_data <- data[, c("Date", "Station_A_Precipitation", "Station_B_Precipitation")]
melted_precip_data <- melt(precipitation_data, id.vars = "Date")

# Stacked bar plot
ggplot(melted_precip_data, aes(x = Date, y = value, fill = variable)) +
  geom_bar(stat = "identity") +
  labs(title = "Stacked Bar Plot of Precipitation", x = "Date", y = "Precipitation (mm)") +
  theme_minimal()
