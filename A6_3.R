# Load necessary libraries
library(ggplot2)

# Create the data
survey_data <- data.frame(
  Product = c("A", "B", "C", "D", "E"),
  Price = c(50, 70, 60, 45, 55),
  Rating = c(4.2, 3.8, 4.0, 4.5, 3.9),
  AgeGroup = c("25-35", "35-45", "18-25", "45-55", "25-35")
)

# Box plot showing Product Ratings by Price and Age Group
ggplot(survey_data, aes(x = factor(AgeGroup), y = Rating, fill = factor(Price))) +
  geom_boxplot() +
  labs(title = "Product Ratings by Age Group and Price", 
       x = "Age Group", y = "Rating (out of 5)", fill = "Price ($)") +
  theme_minimal()
# Density plot to visualize the relationship between Price, Rating, and Age Group
ggplot(survey_data, aes(x = Price, y = Rating, fill = AgeGroup)) +
  geom_density_2d() +
  geom_raster(aes(fill = ..density..), alpha = 0.5) +
  scale_fill_viridis_c() +
  labs(title = "Density Plot of Price and Rating by Age Group", 
       x = "Price ($)", y = "Rating (out of 5)") +
  theme_minimal()
# Load necessary library for 3D plotting
library(plotly)

# Create a factor for Age Group for better visualization
survey_data$AgeGroupFactor <- as.factor(survey_data$AgeGroup)

# 3D scatter plot
plot_ly(survey_data, x = ~Price, y = ~Rating, z = ~as.numeric(AgeGroupFactor), type = 'scatter3d', mode = 'markers',
        marker = list(size = 5, color = ~as.numeric(AgeGroupFactor), colorscale = 'Viridis')) %>%
  layout(title = "3D Plot of Price, Rating, and Age Group",
         scene = list(xaxis = list(title = 'Price ($)'),
                      yaxis = list(title = 'Rating (out of 5)'),
                      zaxis = list(title = 'Age Group (as factor)')))
