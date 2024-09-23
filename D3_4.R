# Data
env_data <- data.frame(
  Location = c('A', 'B', 'C', 'D', 'E'),
  Temperature = c(15, 20, 18, 12, 17),
  Humidity = c(65, 70, 68, 60, 72),
  CO2Levels = c(400, 450, 420, 380, 430)
)

# Scatter plot: CO2 Levels vs Temperature
plot(env_data$Temperature, env_data$CO2Levels, xlab = "Temperature (°C)", ylab = "CO2 Levels (ppm)", col = "blue", main = "CO2 Levels vs Temperature")

# Scatter plot: CO2 Levels vs Humidity
plot(env_data$Humidity, env_data$CO2Levels, xlab = "Humidity (%)", ylab = "CO2 Levels (ppm)", col = "green", main = "CO2 Levels vs Humidity")

library(scatterplot3d)

# 3D Scatter plot
scatterplot3d(env_data$Temperature, env_data$Humidity, env_data$CO2Levels, xlab = "Temperature (°C)", ylab = "Humidity (%)", zlab = "CO2 Levels (ppm)", main = "3D Scatter Plot: Temperature, Humidity, CO2 Levels", pch = 19)

library(plotly)

# 3D Surface plot
fig <- plot_ly(env_data, x = ~Temperature, y = ~Humidity, z = ~CO2Levels, type = "mesh3d")
fig <- fig %>% layout(scene = list(xaxis = list(title = 'Temperature (°C)'), yaxis = list(title = 'Humidity (%)'), zaxis = list(title = 'CO2 Levels (ppm)')))
fig

# 3D plot: CO2 Levels vs Temperature and Humidity
fig1 <- plot_ly(env_data, x = ~Temperature, y = ~CO2Levels, z = ~Humidity, type = "scatter3d", mode = "markers")
fig1 <- fig1 %>% layout(scene = list(xaxis = list(title = 'Temperature (°C)'), yaxis = list(title = 'CO2 Levels (ppm)'), zaxis = list(title = 'Humidity (%)')))
fig1
