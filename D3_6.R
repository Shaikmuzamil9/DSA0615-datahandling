# Install the necessary packages if not already installed
# install.packages("arules")
# install.packages("arulesViz")

library(arules)
library(arulesViz)
# Simulating a small transaction dataset
transactions <- list(
  c("milk", "bread", "butter"),
  c("bread", "butter"),
  c("milk", "bread"),
  c("butter", "eggs"),
  c("milk", "eggs"),
  c("bread", "eggs", "butter"),
  c("milk", "bread", "eggs")
)

# Converting the list to transactions
trans <- as(transactions, "transactions")

# Inspect the transactions
inspect(trans)

# Apply Apriori algorithm with minimum support and confidence
rules <- apriori(trans, parameter = list(supp = 0.2, conf = 0.5))

# Inspect the rules
inspect(rules)


# Plot the association rules in a network graph
plot(rules, method = "graph", control = list(type = "items"))

# Plot the association rules in a heatmap
plot(rules, method = "matrix", measure = "lift", shading = "confidence")
