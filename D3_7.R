
# Install necessary packages if not already installed
# install.packages("dplyr")
# install.packages("ggplot2")
# install.packages("lubridate")

library(dplyr)
library(ggplot2)
library(lubridate)
# Simulating customer transaction data
set.seed(123)
customer_data <- data.frame(
  CustomerID = sample(1:100, 1000, replace = TRUE),
  TransactionDate = sample(seq(as.Date('2020-01-01'), as.Date('2023-12-31'), by="day"), 1000, replace = TRUE),
  Revenue = runif(1000, min = 50, max = 500)
)

# Preview the data
head(customer_data)
# Preprocessing data to extract year
customer_data <- customer_data %>%
  mutate(Year = year(TransactionDate))

# Group by CustomerID to calculate total revenue and the number of transactions
customer_clv <- customer_data %>%
  group_by(CustomerID) %>%
  summarise(TotalRevenue = sum(Revenue),
            PurchaseFrequency = n(),
            FirstPurchase = min(TransactionDate),
            LastPurchase = max(TransactionDate)) %>%
  mutate(CustomerLifespan = as.numeric(difftime(LastPurchase, FirstPurchase, units = "days")) / 365)

# Estimate CLV (for simplicity, excluding acquisition costs)
customer_clv <- customer_clv %>%
  mutate(CLV = (TotalRevenue / PurchaseFrequency) * PurchaseFrequency * CustomerLifespan)

# Preview the CLV data
head(customer_clv)

# Create customer segments based on total revenue
customer_clv <- customer_clv %>%
  mutate(RevenueSegment = ntile(TotalRevenue, 5))

# Bar chart to visualize CLV by revenue segments
ggplot(customer_clv, aes(x = factor(RevenueSegment), y = CLV)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(x = "Revenue Segment", y = "Customer Lifetime Value (CLV)", title = "CLV by Customer Segments")
# Group by year of first purchase (cohort analysis)
cohort_clv <- customer_clv %>%
  mutate(Cohort = year(FirstPurchase)) %>%
  group_by(Cohort) %>%
  summarise(AverageCLV = mean(CLV))

# Line chart to visualize CLV over cohorts
ggplot(cohort_clv, aes(x = Cohort, y = AverageCLV)) +
  geom_line(color = "blue", size = 1) +
  geom_point(size = 2, color = "red") +
  labs(x = "Cohort (Year)", y = "Average CLV", title = "Average CLV by Customer Cohorts")
