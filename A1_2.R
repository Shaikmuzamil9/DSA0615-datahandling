# Load necessary libraries
library(ggplot2)
library(vcd)

# Create the dataset
data <- data.frame(
  SCHOOL = factor(rep(c("A", "B", "C", "D"), each = 3)),
  GRADE_LEVEL = factor(rep(c("Grade 1", "Grade 2", "Grade 3"), times = 4)),
  NUMBER_OF_STUDENTS = c(25, 30, 20, 22, 28, 18, 20, 25, 15, 28, 32, 24)
)

# Create the mosaic plot
mosaic(~ SCHOOL + GRADE_LEVEL, data = data, shade = TRUE, legend = TRUE,
       main = "Mosaic Plot of Number of Students by School and Grade Level")
# Create the histogram plot for the number of students
ggplot(data, aes(x = NUMBER_OF_STUDENTS)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "black") +
  labs(title = "Histogram of Number of Students", x = "Number of Students", y = "Frequency") +
  theme_minimal()
# Scatter plot of number of students by school and grade level
ggplot(data, aes(x = GRADE_LEVEL, y = NUMBER_OF_STUDENTS, color = SCHOOL)) +
  geom_point(size = 3) +
  labs(title = "Scatter Plot of Number of Students by School and Grade Level", 
       x = "Grade Level", y = "Number of Students") +
  theme_minimal()
