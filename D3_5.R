# Data
performance_data <- data.frame(
  Student = c('A', 'B', 'C', 'D', 'E'),
  MathScore = c(85, 72, 90, 78, 88),
  ScienceScore = c(78, 85, 80, 75, 82),
  Attendance = c(95, 92, 98, 85, 93)
)

# Scatter plot: Science Score vs Math Score
plot(performance_data$MathScore, performance_data$ScienceScore, xlab = "Math Score", ylab = "Science Score", col = "blue", main = "Science Score vs Math Score")

# Scatter plot: Science Score vs Attendance
plot(performance_data$Attendance, performance_data$ScienceScore, xlab = "Attendance (%)", ylab = "Science Score", col = "green", main = "Science Score vs Attendance

library(scatterplot3d)

# 3D Scatter plot
scatterplot3d(performance_data$MathScore, performance_data$Attendance, performance_data$ScienceScore, 
              xlab = "Math Score", ylab = "Attendance (%)", zlab = "Science Score", 
              main = "3D Scatter Plot: Math Score, Attendance, and Science Score", pch = 19)


cor(performance_data[, c("MathScore", "ScienceScore", "Attendance")])


library(plotly)

# 3D Surface plot
fig <- plot_ly(performance_data, x = ~MathScore, y = ~Attendance, z = ~ScienceScore, type = "mesh3d")
fig <- fig %>% layout(scene = list(xaxis = list(title = 'Math Score'), yaxis = list(title = 'Attendance (%)'), zaxis = list(title = 'Science Score')))
fig


# 3D plot: Science Score vs Math Score and Attendance
fig1 <- plot_ly(performance_data, x = ~MathScore, y = ~ScienceScore, z = ~Attendance, type = "scatter3d", mode = "markers")
fig1 <- fig1 %>% layout(scene = list(xaxis = list(title = 'Math Score'), yaxis = list(title = 'Science Score'), zaxis = list(title = 'Attendance (%)')))
fig1
