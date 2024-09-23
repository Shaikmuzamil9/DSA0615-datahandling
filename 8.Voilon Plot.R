library(ggplot2)
data <- data.frame(
  Group = c("X", "X", "X", "X", "Y", "Y", "Y", "Y"),
  Score = c(80, 85, 78, 92, 88, 76, 80, 84)
)
ggplot(data, aes(x = Group, y = Score, fill = Group)) +
  geom_violin(trim = FALSE) +
  labs(title = "Violin Plot of Scores by Group", 
       x = "Group", 
       y = "Score") +
  theme_minimal()
