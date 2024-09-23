# Load necessary libraries
library(ggplot2)

# Create the data
survey_data <- data.frame(
  ID = c(1, 2, 3, 4, 5),
  Q1 = c("Yes", "No", "Yes", "Yes", "No"),
  Q2 = c(25, 30, 28, 35, 40),
  Q3 = c("A", "B", "C", "A", "B"),
  Q4 = c(3.5, 4.2, 3.8, 3.9, 4.5)
)

# Bar plot showing the count of responses for Q1
ggplot(survey_data, aes(x = Q1)) +
  geom_bar(fill = "lightblue") +
  labs(title = "Count of Responses for Q1", x = "Response for Q1", y = "Count") +
  theme_minimal()
# Histogram for Q2
ggplot(survey_data, aes(x = Q2)) +
  geom_histogram(binwidth = 5, fill = "lightgreen", color = "black") +
  labs(title = "Histogram of Responses for Q2", x = "Q2 Response", y = "Frequency") +
  theme_minimal()


# Grouped bar plot for average Q4 by Q1 response
avg_Q4_Q1 <- aggregate(Q4 ~ Q1, data = survey_data, FUN = mean)

ggplot(avg_Q4_Q1, aes(x = Q1, y = Q4, fill = Q1)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Average Q4 Values for Different Responses in Q1", x = "Q1 Response", y = "Average Q4") +
  theme_minimal()
# Stacked bar plot for distribution of responses in Q3
ggplot(survey_data, aes(x = Q3, fill = Q1)) +
  geom_bar() +
  labs(title = "Stacked Bar Plot of Responses in Q3", x = "Q3 Response", y = "Count", fill = "Q1 Response") +
  theme_minimal()


# Load necessary library for radar chart
library(fmsb)

# Prepare data for radar chart
radar_data <- aggregate(Q4 ~ Q1, data = survey_data, FUN = mean)
radar_data <- t(radar_data[, -1])  # Remove Q1 and transpose
colnames(radar_data) <- c("No", "Yes")  # Set column names as Q1 responses

# Add max and min values for radar chart scaling
radar_data <- rbind(max = 5, min = 0, radar_data)

# Radar chart
radarchart(radar_data,
           pcol = c("red", "blue"),
           pfcol = c(rgb(0.2, 0.5, 0.5, 0.5), rgb(0.8, 0.2, 0.5, 0.5)),
           title = "Radar Chart: Average Q4 by Q1 Response")
