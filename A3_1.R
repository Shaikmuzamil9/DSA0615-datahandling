# Load necessary libraries
library(ggplot2)
library(reshape2)

# Create data
weather_data <- data.frame(
  Date = as.Date(c("2023-01-01", "2023-01-02", "2023-01-03", "2023-01-04", "2023-01-05")),
  Temperature = c(10, 12, 8, 15, 14),
  Humidity = c(75, 70, 80, 65, 72),
  Wind_Speed = c(15, 12, 18, 20, 16)
)

# Reshape the data for heatmap
melted_data <- melt(weather_data, id.vars = "Date")

# Create heat map
ggplot(melted_data, aes(x = Date, y = variable, fill = value)) +
  geom_tile() +
  scale_fill_gradient(low = "blue", high = "red") +
  labs(title = "Heat Map of Weather Data", x = "Date", y = "Variables") +
  theme_minimal()
# Reshape the data for violin plot
melted_data_violin <- melt(weather_data, id.vars = "Date")

# Create violin plot
ggplot(melted_data_violin, aes(x = variable, y = value, fill = variable)) +
  geom_violin(trim = FALSE) +
  labs(title = "Violin Plot of Weather Data", x = "Variables", y = "Values") +
  theme_minimal()
# Create box plot
ggplot(melted_data_violin, aes(x = variable, y = value, fill = variable)) +
  geom_boxplot() +
  labs(title = "Box Plot of Weather Data", x = "Variables", y = "Values") +
  theme_minimal()
