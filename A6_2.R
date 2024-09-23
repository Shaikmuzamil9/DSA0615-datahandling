# Create the data
financial_data <- data.frame(
  Date = as.Date(c("2023-01-01", "2023-01-02", "2023-01-03", "2023-01-04", "2023-01-05")),
  StockPrice = c(100, 102, 98, 105, 108),
  VolumeTraded = c(2.5, 3.0, 2.2, 2.8, 3.5),
  MarketCap = c(500, 510, 490, 525, 540)
)

# Correlation matrix
cor_matrix <- cor(financial_data[, -1])  # Exclude the Date column

print(cor_matrix)
# Load necessary libraries
library(ggplot2)

# Scatter plot to show the relationship between Volume Traded and Market Cap with Stock Price as size
ggplot(financial_data, aes(x = VolumeTraded, y = MarketCap, size = StockPrice)) +
  geom_point(color = "blue", alpha = 0.7) +
  labs(title = "Scatter Plot of Volume Traded vs Market Cap with Stock Price as Size", 
       x = "Volume Traded (millions)", y = "Market Cap ($)", size = "Stock Price ($)") +
  theme_minimal()
# Load necessary library for 3D plotting
library(plotly)

# 3D scatter plot of Stock Price, Volume Traded, and Market Cap
plot_ly(financial_data, x = ~VolumeTraded, y = ~MarketCap, z = ~StockPrice, type = 'scatter3d', mode = 'markers',
        marker = list(size = ~StockPrice/2, color = ~StockPrice, colorscale = 'Viridis')) %>%
  layout(title = "3D Plot of Stock Price, Volume Traded, and Market Cap",
         scene = list(xaxis = list(title = 'Volume Traded (millions)'),
                      yaxis = list(title = 'Market Cap ($)'),
                      zaxis = list(title = 'Stock Price ($)')))
