# Load necessary libraries
library(ggplot2)

# Create the dataset
data <- data.frame(
  Month = factor(c("Jan", "Feb", "March", "April", "May", "Jun", "July", "August", "Sep", "Oct", "Nov", "Dec"),
                 levels = c("Jan", "Feb", "March", "April", "May", "Jun", "July", "August", "Sep", "Oct", "Nov", "Dec")),
  Economic_Condition = c("Good", "Good", "Good", "Good", "Fair", "Fair", "Good", "Bad", "Fair", "Good", "Bad", "Fair"),
  Unemployment_Rate = c(10.7, 9.8, 10.2, 11.2, 15.75, 17.8, 19.4, 25.6, 18.6, 15.6, 26.7, 19.5)
)

# Convert Unemployment_Rate to numeric (remove any percentages or invalid characters)
data$Unemployment_Rate <- as.numeric(gsub("%", "", data$Unemployment_Rate))

# Create a stacked bar plot
ggplot(data, aes(x = Month, y = Unemployment_Rate, fill = Economic_Condition)) +
  geom_bar(stat = "identity") +
  labs(title = "Stacked Bar Plot of Unemployment Rates by Economic Condition", 
       x = "Month", y = "Unemployment Rate") +
  theme_minimal()
# Summarize the data by Economic Condition
data_summary <- aggregate(Unemployment_Rate ~ Economic_Condition, data, sum)

# Create a pie chart for Economic Condition
pie(data_summary$Unemployment_Rate, 
    labels = data_summary$Economic_Condition, 
    main = "Pie Plot of Unemployment Rates by Economic Condition",
    col = rainbow(length(data_summary$Economic_Condition)))


# Create a grouped bar plot
ggplot(data, aes(x = Month, y = Unemployment_Rate, fill = Economic_Condition)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Grouped Bar Plot of Unemployment Rates by Economic Condition", 
       x = "Month", y = "Unemployment Rate") +
  theme_minimal()
