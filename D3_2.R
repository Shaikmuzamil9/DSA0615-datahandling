# Data
market_data <- data.frame(
  Date = as.Date(c('2023-01-01', '2023-01-02', '2023-01-03', '2023-01-04', '2023-01-05')),
  StockPrice = c(100, 102, 98, 105, 108),
  VolumeTraded = c(2.5, 3.0, 2.2, 2.8, 3.5),
  MarketCap = c(500, 510, 490, 525, 540)
)

# Scatter plot: Stock Price vs Volume Traded
plot(market_data$VolumeTraded, market_data$StockPrice, xlab = "Volume Traded (millions)", ylab = "Stock Price ($)", col = "blue", main = "Stock Price vs Volume Traded")

# Scatter plot: Stock Price vs Market Cap
plot(market_data$MarketCap, market_data$StockPrice, xlab = "Market Cap ($)", ylab = "Stock Price ($)", col = "red", main = "Stock Price vs Market Cap")


# Data
market_data <- data.frame(
  Date = as.Date(c('2023-01-01', '2023-01-02', '2023-01-03', '2023-01-04', '2023-01-05')),
  StockPrice = c(100, 102, 98, 105, 108),
  VolumeTraded = c(2.5, 3.0, 2.2, 2.8, 3.5),
  MarketCap = c(500, 510, 490, 525, 540)
)

# Scatter plot: Stock Price vs Volume Traded
plot(market_data$VolumeTraded, market_data$StockPrice, xlab = "Volume Traded (millions)", ylab = "Stock Price ($)", col = "blue", main = "Stock Price vs Volume Traded")

# Scatter plot: Stock Price vs Market Cap
plot(market_data$MarketCap, market_data$StockPrice, xlab = "Market Cap ($)", ylab = "Stock Price ($)", col = "red", main = "Stock Price vs Market Cap")


library(plotly)

# 3D Surface plot
fig <- plot_ly(market_data, x = ~StockPrice, y = ~VolumeTraded, z = ~MarketCap, type = "mesh3d")
fig <- fig %>% layout(scene = list(xaxis = list(title = 'Stock Price ($)'), yaxis = list(title = 'Volume Traded (millions)'), zaxis = list(title = 'Market Cap ($)')))
fig


# 3D plot: Stock Price vs Volume Traded and Market Cap
fig1 <- plot_ly(market_data, x = ~VolumeTraded, y = ~StockPrice, z = ~MarketCap, type = "scatter3d", mode = "markers")
fig1 <- fig1 %>% layout(scene = list(xaxis = list(title = 'Volume Traded (millions)'), yaxis = list(title = 'Stock Price ($)'), zaxis = list(title = 'Market Cap ($)')))
fig1
