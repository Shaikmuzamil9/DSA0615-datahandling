# Create the dataset
data <- data.frame(
  Year = c(2019, 2020, 2022, 2023, 2024),
  Browser = c("Chrome", "Chrome", "Chrome", "Chrome", "Chrome"),
  Users = c(22.7, 25.8, 28.7, 30.5, 35.2) * 1e6  # Converting Millions to actual values
)
# Load necessary libraries
library(ggplot2)

# Summarize data by year
data_summary <- aggregate(Users ~ Year, data, sum)

# Create a pie chart
pie(data_summary$Users, 
    labels = data_summary$Year, 
    main = "Pie Plot of Internet Users by Year")

# Load necessary library
library(vcd)

# Create the mosaic plot
mosaic(~ Year + Browser, data = data, shade = TRUE, legend = TRUE,
       main = "Mosaic Plot of Browser Usage Over Years")
# Scatter plot of users over time
ggplot(data, aes(x = Year, y = Users)) +
  geom_point(size = 3, color = "blue") +
  geom_line(color = "red") +
  labs(title = "Scatter Plot of Users Over Time", x = "Year", y = "Users (in millions)") +
  theme_minimal()
