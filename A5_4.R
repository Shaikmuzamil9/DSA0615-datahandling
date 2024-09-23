# Load necessary libraries
library(ggplot2)

# Create the data
city_data <- data.frame(
  City = c("New York", "Los Angeles", "Chicago", "Houston", "Phoenix"),
  Latitude = c(40.7128, 34.0522, 41.8781, 29.7604, 33.4484),
  Longitude = c(-74.0060, -118.2437, -87.6298, -95.3698, -112.0740),
  Population = c(8398748, 3990456, 2705994, 2325502, 1660272),
  Region = c("Northeast", "West Coast", "Midwest", "South", "West Coast")
)

# Scatter plot of cities on a map
ggplot(city_data, aes(x = Longitude, y = Latitude)) +
  borders("state") +
  geom_point(aes(size = Population, color = Region), alpha = 0.7) +
  labs(title = "Scatter Plot of Cities by Latitude and Longitude", x = "Longitude", y = "Latitude") +
  theme_minimal()

# Choropleth map of Population by Region
ggplot(city_data, aes(x = Region, y = Population, fill = Region)) +
  geom_bar(stat = "identity") +
  labs(title = "Choropleth-like Map: Population by Region", x = "Region", y = "Population") +
  theme_minimal()


# Bubble map for Population by Latitude and Longitude
ggplot(city_data, aes(x = Longitude, y = Latitude)) +
  borders("state") +
  geom_point(aes(size = Population, color = Region), alpha = 0.7) +
  scale_size_continuous(range = c(3, 15)) +
  labs(title = "Bubble Map: Cities by Population", x = "Longitude", y = "Latitude") +
  theme_minimal()
# Kernel density plot based on population
ggplot(city_data, aes(x = Longitude, y = Latitude)) +
  borders("state") +
  geom_point(aes(size = Population), alpha = 0.7) +
  geom_density2d(color = "blue") +
  labs(title = "Kernel Density Plot of Cities by Population", x = "Longitude", y = "Latitude") +
  theme_minimal()


# Load necessary library for 3D plotting
library(plotly)

# 3D scatter plot
plot_ly(city_data, x = ~Longitude, y = ~Latitude, z = ~Population, type = 'scatter3d', mode = 'markers',
        marker = list(size = ~Population/1000000, color = ~Region)) %>%
  layout(title = "3D Scatter Plot of Cities by Latitude, Longitude, and Population",
         scene = list(xaxis = list(title = "Longitude"),
                      yaxis = list(title = "Latitude"),
                      zaxis = list(title = "Population")))
