# Data
survey_data <- data.frame(
  Product = c('A', 'B', 'C', 'D', 'E'),
  Price = c(50, 70, 60, 45, 55),
  Rating = c(4.2, 3.8, 4.0, 4.5, 3.9),
  AgeGroup = factor(c('25-35', '35-45', '18-25', '45-55', '25-35'))
)

# Convert AgeGroup to a numeric scale for visual purposes
survey_data$AgeGroupNumeric <- as.numeric(survey_data$AgeGroup)

# Scatter plot: Rating vs Price
plot(survey_data$Price, survey_data$Rating, xlab = "Price ($)", ylab = "Rating (out of 5)", col = "blue", main = "Rating vs Price")

# Scatter plot: Rating vs Age Group
plot(survey_data$AgeGroupNumeric, survey_data$Rating, xlab = "Age Group", ylab = "Rating (out of 5)", col = "red", main = "Rating vs Age Group", xaxt = "n")
axis(1, at = 1:length(levels(survey_data$AgeGroup)), labels = levels(survey_data$AgeGroup))


library(scatterplot3d)

# 3D Scatter plot: Price, Rating, Age Group
scatterplot3d(survey_data$Price, survey_data$AgeGroupNumeric, survey_data$Rating, xlab = "Price ($)", ylab = "Age Group", zlab = "Rating (out of 5)", main = "3D Scatter Plot: Price, Age Group, Rating", pch = 19)

cor(survey_data[, c("Price", "Rating", "AgeGroupNumeric")])

library(plotly)

# 3D Surface plot: Rating, Price, Age Group
fig <- plot_ly(survey_data, x = ~Price, y = ~AgeGroupNumeric, z = ~Rating, type = "mesh3d")
fig <- fig %>% layout(scene = list(xaxis = list(title = 'Price ($)'), yaxis = list(title = 'Age Group'), zaxis = list(title = 'Rating (out of 5)')))
fig


# 3D plot: Rating vs Price and Age Group
fig1 <- plot_ly(survey_data, x = ~Price, y = ~Rating, z = ~AgeGroupNumeric, type = "scatter3d", mode = "markers")
fig1 <- fig1 %>% layout(scene = list(xaxis = list(title = 'Price ($)'), yaxis = list(title = 'Rating (out of 5)'), zaxis = list(title = 'Age Group')))
fig1
