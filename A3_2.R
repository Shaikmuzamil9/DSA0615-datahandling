# Create data
financial_data <- data.frame(
  Date = as.Date(c("2023-01-01", "2023-01-02", "2023-01-03", "2023-01-04", "2023-01-05")),
  Stock_Price = c(100, 102, 98, 105, 108),
  Volume_Traded = c(2.5, 3.0, 2.2, 2.8, 3.5),
  Market_Cap = c(500, 510, 490, 525, 540)
)

# Calculate the mean for each column (ignoring the Date column)
mean_stock_price <- mean(financial_data$Stock_Price)
mean_volume_traded <- mean(financial_data$Volume_Traded)
mean_market_cap <- mean(financial_data$Market_Cap)

# Print results
mean_stock_price
mean_volume_traded
mean_market_cap
# Load ggplot2
library(ggplot2)

# Reshape the data for visualization
melted_data <- melt(financial_data, id.vars = "Date")

# Create bar plot
ggplot(melted_data, aes(x = Date, y = value, fill = variable)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Bar Plot of Financial Market Data", x = "Date", y = "Value") +
  theme_minimal()
