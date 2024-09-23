# Load necessary libraries
library(ggplot2)

# Create the data
weather_data <- data.frame(
  Date = as.Date(c("2023-01-01", "2023-01-02", "2023-01-03", "2023-01-04", "2023-01-05")),
  Temperature = c(10, 12, 8, 15, 14),
  Humidity = c(75, 70, 80, 65, 72),
  WindSpeed = c(15, 12, 18, 20, 16)
)

# Reshape data for easier plotting
weather_melted <- reshape2::melt(weather_data, id.vars = "Date")

# Line plot to see variation in Temperature, Humidity, and Wind Speed
ggplot(weather_melted, aes(x = Date, y = value, color = variable)) +
  geom_line(size = 1) +
  labs(title = "Variation of Temperature, Humidity, and Wind Speed Over Time", 
       x = "Date", y = "Values", color = "Legend") +
  theme_minimal()

# Load necessary libraries
library(ggplot2)

# Create the data
weather_data <- data.frame(
  Date = as.Date(c("2023-01-01", "2023-01-02", "2023-01-03", "2023-01-04", "2023-01-05")),
  Temperature = c(10, 12, 8, 15, 14),
  Humidity = c(75, 70, 80, 65, 72),
  WindSpeed = c(15, 12, 18, 20, 16)
)

# Reshape data for easier plotting
weather_melted <- reshape2::melt(weather_data, id.vars = "Date")

# Line plot to see variation in Temperature, Humidity, and Wind Speed
ggplot(weather_melted, aes(x = Date, y = value, color = variable)) +
  geom_line(size = 1) +
  labs(title = "Variation of Temperature, Humidity, and Wind Speed Over Time", 
       x = "Date", y = "Values", color = "Legend") +
  theme_minimal()
# Correlation heatmap
corr_matrix <- cor(weather_data[, -1])

library(reshape2)
melted_corr_matrix <- melt(corr_matrix)

ggplot(data = melted_corr_matrix, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1, 1), space = "Lab", 
                       name="Correlation") +
  labs(title = "Correlation Heatmap of Temperature, Humidity, and Wind Speed") +
  theme_minimal()
