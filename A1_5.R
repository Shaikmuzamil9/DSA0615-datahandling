# Create the dataset
data <- data.frame(
  Year = c(2019, 2020, 2022, 2023, 2024),
  Job_Sector = c("IT", "Government Job", "Customer care", "Bank", "Games"),
  Job_Seekers_Rate = c(95, 97, 98, 82, 74),
  Selection_Rate = c(25, 12, 45, 20, 35)
)

# Load necessary libraries
library(ggplot2)

# Create a pie chart for Job Seekers' Rate by Job Sector
pie(data$Job_Seekers_Rate, 
    labels = data$Job_Sector, 
    main = "Pie Plot of Job Seekers' Rate by Job Sector")
# Load necessary libraries
library(vcd)

# Create the mosaic plot
mosaic(~ Job_Sector + Job_Seekers_Rate + Selection_Rate, data = data, shade = TRUE, legend = TRUE,
       main = "Mosaic Plot of Job Seekers and Selection Rate by Job Sector")

# Load necessary libraries
library(ggplot2)

# Create the funnel plot
ggplot(data, aes(x = Job_Seekers_Rate, y = Selection_Rate, label = Job_Sector)) +
  geom_point(size = 3, color = "blue") +
  geom_text(vjust = -1) +
  labs(title = "Funnel Plot of Job Seekers Rate vs Selection Rate", 
       x = "Job Seekers Rate (%)", y = "Selection Rate (%)") +
  theme_minimal()
