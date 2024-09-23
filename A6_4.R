# Load necessary libraries
library(ggplot2)

# Create the data
env_data <- data.frame(
  Location = c("A", "B", "C", "D", "E"),
  Temperature = c(15, 20, 18, 12, 17),
  Humidity = c(65, 70, 68, 60, 72),
  CO2Levels = c(400, 450, 420, 380, 430)
)

# Scatter plot showing CO2 levels by Temperature and Humidity
ggplot(env_data, aes(x = Temperature, y = Humidity, size = CO2Levels, color = Location)) +
  geom_point(alpha = 0.7) +
  labs(title = "CO2 Levels Variation with Temperature and Humidity", 
       x = "Temperature (°C)", y = "Humidity (%)", size = "CO2 Levels (ppm)", color = "Location") +
  theme_minimal()
# Reshape data for easier plotting
library(reshape2)
env_data_melted <- melt(env_data, id.vars = "Location")

# Line plot showing Temperature, Humidity, and CO2 Levels
ggplot(env_data_melted, aes(x = Location, y = value, color = variable, group = variable)) +
  geom_line(size = 1) +
  geom_point(size = 3) +
  labs(title = "Temperature, Humidity, and CO2 Levels Across Locations", 
       x = "Location", y = "Values", color = "Variable") +
  theme_minimal()
# Load necessary library for 3D plotting
library(plotly)

# 3D scatter plot of Temperature, Humidity, and CO2 Levels
plot_ly(env_data, x = ~Temperature, y = ~Humidity, z = ~CO2Levels, type = 'scatter3d', mode = 'markers',
        marker = list(size = 5, color = ~CO2Levels, colorscale = 'Viridis')) %>%
  layout(title = "3D Plot of Temperature, Humidity, and CO2 Levels",
         scene = list(xaxis = list(title = 'Temperature (°C)'),
                      yaxis = list(title = 'Humidity (%)'),
                      zaxis = list(title = 'CO2 Levels (ppm)')))
