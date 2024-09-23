# Data
weather_data <- data.frame(
  Date = as.Date(c('2023-01-01', '2023-01-02', '2023-01-03', '2023-01-04', '2023-01-05')),
  Temperature = c(10, 12, 8, 15, 14),
  Humidity = c(75, 70, 80, 65, 72),
  WindSpeed = c(15, 12, 18, 20, 16)
)

# Scatter plot
plot(weather_data$Humidity, weather_data$Temperature, xlab = "Humidity (%)", ylab = "Temperature (°C)", col = "blue", main = "Temperature vs Humidity")
plot(weather_data$WindSpeed, weather_data$Temperature, xlab = "Wind Speed (km/h)", ylab = "Temperature (°C)", col = "red", main = "Temperature vs Wind Speed")

library(scatterplot3d)

# 3D Scatter plot
scatterplot3d(weather_data$Humidity, weather_data$WindSpeed, weather_data$Temperature, xlab = "Humidity (%)", ylab = "Wind Speed (km/h)", zlab = "Temperature (°C)", main = "3D Scatter Plot")

cor(weather_data[, c("Temperature", "Humidity", "WindSpeed")])

library(plotly)

# 3D Surface plot
fig <- plot_ly(weather_data, x = ~Humidity, y = ~WindSpeed, z = ~Temperature, type = "mesh3d")
fig <- fig %>% layout(scene = list(xaxis = list(title = 'Humidity (%)'), yaxis = list(title = 'Wind Speed (km/h)'), zaxis = list(title = 'Temperature (°C)')))
fig


# Temperature vs Humidity and Wind Speed (3D)
fig1 <- plot_ly(weather_data, x = ~Humidity, y = ~Temperature, z = ~WindSpeed, type = "scatter3d", mode = "markers")
fig1 <- fig1 %>% layout(scene = list(xaxis = list(title = 'Humidity (%)'), yaxis = list(title = 'Temperature (°C)'), zaxis = list(title = 'Wind Speed (km/h)')))
fig1
