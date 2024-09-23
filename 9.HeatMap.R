library(ggplot2)
library(reshape2)
data <- data.frame(
  Month = c("Jan", "Feb", "Mar", "Apr", "May"),
  City_A = c(5, 6, 7, 8, 9),
  City_B = c(10, 11, 12, 13, 14),
  City_C = c(15, 16, 17, 18, 19)
)
data_melted <- melt(data, id.vars = "Month")
ggplot(data_melted, aes(x = Month, y = variable, fill = value)) +
  geom_tile() +
  scale_fill_gradient(low = "white", high = "blue") +
  labs(title = "Monthly Temperatures Heatmap", 
       x = "Month", 
       y = "City", 
       fill = "Temperature (°C)") +
  theme_minimal()
