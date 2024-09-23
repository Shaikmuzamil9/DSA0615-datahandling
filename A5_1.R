# Load necessary libraries
library(ggplot2)

# Create data
longitudinal_data <- data.frame(
  ID = c(1, 1, 1, 2, 2, 2),
  Time = c(1, 2, 3, 1, 2, 3),
  Value = c(10, 15, 20, 12, 18, 25)  # Assuming some values for the plot
)

# Line plot for each ID
ggplot(longitudinal_data, aes(x = Time, y = Value, group = ID, color = as.factor(ID))) +
  geom_line() +
  geom_point() +
  labs(title = "Line Plot of Value over Time by ID", x = "Time", y = "Value", color = "ID") +
  theme_minimal()
# Grouped bar plot
ggplot(longitudinal_data, aes(x = as.factor(Time), y = Value, fill = as.factor(ID))) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Grouped Bar Plot Comparing Values at Different Times", x = "Time", y = "Value", fill = "ID") +
  theme_minimal()
# Scatter plot with color-coded IDs
ggplot(longitudinal_data, aes(x = Time, y = Value, color = as.factor(ID))) +
  geom_point(size = 3) +
  labs(title = "Scatter Plot of Value vs Time, Color-Coded by ID", x = "Time", y = "Value", color = "ID") +
  theme_minimal()

# Connected scatter plot (similar to line plot with points)
ggplot(longitudinal_data, aes(x = Time, y = Value, group = ID, color = as.factor(ID))) +
  geom_line() +
  geom_point() +
  labs(title = "Connected Scatter Plot of Value over Time by ID", x = "Time", y = "Value", color = "ID") +
  theme_minimal()
# Stacked area chart
ggplot(longitudinal_data, aes(x = Time, y = Value, fill = as.factor(ID))) +
  geom_area(alpha = 0.6) +
  labs(title = "Stacked Area Chart of Cumulative Values over Time by ID", x = "Time", y = "Cumulative Value", fill = "ID") +
  theme_minimal()
