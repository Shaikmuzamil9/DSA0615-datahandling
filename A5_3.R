# Load necessary libraries
library(ggplot2)

# Create the data
transaction_data <- data.frame(
  Transaction_ID = c(1, 2, 3, 4, 5),
  Date = as.Date(c("2023-01-01", "2023-01-02", "2023-01-02", "2023-01-03", "2023-01-03")),
  Product = c("A", "B", "A", "C", "B"),
  Quantity = c(2, 1, 3, 2, 1),
  Price = c(10, 15, 12, 8, 15)
)

# Bar plot showing count of transactions by Date
ggplot(transaction_data, aes(x = as.factor(Date))) +
  geom_bar(fill = "skyblue") +
  labs(title = "Count of Transactions by Date", x = "Date", y = "Transaction Count") +
  theme_minimal()

# Histogram for price distribution
ggplot(transaction_data, aes(x = Price)) +
  geom_histogram(bins = 5, fill = "lightgreen", color = "black") +
  labs(title = "Histogram of Transaction Prices", x = "Price", y = "Frequency") +
  theme_minimal()

# Stacked bar plot of total quantity of products sold by Date
ggplot(transaction_data, aes(x = as.factor(Date), y = Quantity, fill = Product)) +
  geom_bar(stat = "identity") +
  labs(title = "Stacked Bar Plot of Total Quantity by Product and Date", x = "Date", y = "Total Quantity", fill = "Product") +
  theme_minimal()

# Calculate cumulative price for each date
transaction_data_cum <- transaction_data %>%
  group_by(Date) %>%
  summarize(Cumulative_Price = cumsum(Price))

# Time series plot for cumulative price over date
ggplot(transaction_data_cum, aes(x = Date, y = Cumulative_Price, group = 1)) +
  geom_line(color = "blue") +
  geom_point() +
  labs(title = "Cumulative Price Over Date", x = "Date", y = "Cumulative Price") +
  theme_minimal()
# Box plot for price analysis
ggplot(transaction_data, aes(x = "", y = Price)) +
  geom_boxplot(fill = "lightcoral") +
  labs(title = "Box Plot of Transaction Prices", x = "", y = "Price") +
  theme_minimal()
