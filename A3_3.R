# Load necessary library
library(ggplot2)

# Create the data
consumer_data <- data.frame(
  Product = c("A", "B", "C", "D", "E"),
  Price = c(50, 70, 60, 45, 55),
  Rating = c(4.2, 3.8, 4.0, 4.5, 3.9),
  Age_Group = c("25-35", "35-45", "18-25", "45-55", "25-35")
)

# ECDF for Price
ggplot(consumer_data, aes(x = Price)) +
  stat_ecdf(geom = "step") +
  labs(title = "ECDF of Product Prices", x = "Price ($)", y = "ECDF") +
  theme_minimal()

# ECDF for Rating
ggplot(consumer_data, aes(x = Rating)) +
  stat_ecdf(geom = "step") +
  labs(title = "ECDF of Product Ratings", x = "Rating (out of 5)", y = "ECDF") +
  theme_minimal()
# Density Histogram for Price
ggplot(consumer_data, aes(x = Price)) +
  geom_histogram(aes(y = ..density..), bins = 5, fill = "blue", alpha = 0.5) +
  geom_density(color = "red") +
  labs(title = "Density Histogram of Product Prices", x = "Price ($)", y = "Density") +
  theme_minimal()

# Density Histogram for Rating
ggplot(consumer_data, aes(x = Rating)) +
  geom_histogram(aes(y = ..density..), bins = 5, fill = "green", alpha = 0.5) +
  geom_density(color = "red") +
  labs(title = "Density Histogram of Product Ratings", x = "Rating (out of 5)", y = "Density") +
  theme_minimal()
# Load the library for skewness calculation
library(e1071)

# Calculate skewness for Price and Rating
skewness_price <- skewness(consumer_data$Price)
skewness_rating <- skewness(consumer_data$Rating)

# Print the skewness values
skewness_price
skewness_rating

# Visualize the distribution (Price)
ggplot(consumer_data, aes(x = Price)) +
  geom_histogram(bins = 5, fill = "blue", alpha = 0.5) +
  geom_density(color = "red") +
  labs(title = paste("Distribution of Product Prices (Skewness =", round(skewness_price, 2), ")"),
       x = "Price ($)", y = "Frequency") +
  theme_minimal()

# Visualize the distribution (Rating)
ggplot(consumer_data, aes(x = Rating)) +
  geom_histogram(bins = 5, fill = "green", alpha = 0.5) +
  geom_density(color = "red") +
  labs(title = paste("Distribution of Product Ratings (Skewness =", round(skewness_rating, 2), ")"),
       x = "Rating (out of 5)", y = "Frequency") +
  theme_minimal()
