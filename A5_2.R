# Load necessary libraries
library(ggplot2)

# Create the data
panel_data <- data.frame(
  Country = c("USA", "USA", "USA", "China", "China", "China"),
  Year = c(2010, 2015, 2020, 2010, 2015, 2020),
  GDP = c(15.2, 18.3, 21.5, 10.5, 12.3, 14.0),
  Population = c(310, 330, 350, 1400, 1450, 1500)
)

# Line plot for GDP over Year
ggplot(panel_data, aes(x = Year, y = GDP, color = Country, group = Country)) +
  geom_line() +
  geom_point() +
  labs(title = "Line Plot of GDP Over Year by Country", x = "Year", y = "GDP (in trillions)", color = "Country") +
  theme_minimal()


# Scatter plot for Population vs GDP
ggplot(panel_data, aes(x = Population, y = GDP, color = Country)) +
  geom_point(size = 3) +
  labs(title = "Scatter Plot of Population vs GDP", x = "Population (in millions)", y = "GDP (in trillions)", color = "Country") +
  theme_minimal()
# Reshape data for stacked bar plot
library(reshape2)
melted_data <- melt(panel_data, id.vars = c("Country", "Year"))

# Stacked bar plot
ggplot(melted_data, aes(x = as.factor(Year), y = value, fill = variable)) +
  geom_bar(stat = "identity", position = "stack") +
  facet_wrap(~Country) +
  labs(title = "Stacked Bar Plot of GDP and Population Over Year", x = "Year", y = "Value", fill = "Metric") +
  theme_minimal()
# Grouped bar plot for GDP over Year by Country
ggplot(panel_data, aes(x = as.factor(Year), y = GDP, fill = Country)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Grouped Bar Plot Comparing GDP Across Years for USA and China", x = "Year", y = "GDP (in trillions)", fill = "Country") +
  theme_minimal()
# Panel plot (faceted plot) for GDP trends
ggplot(panel_data, aes(x = Year, y = GDP)) +
  geom_line(aes(group = Country, color = Country)) +
  geom_point() +
  facet_wrap(~Country) +
  labs(title = "Panel Plot Showing GDP Trends for Each Country", x = "Year", y = "GDP (in trillions)") +
  theme_minimal()
