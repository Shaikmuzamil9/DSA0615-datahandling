# Install necessary packages if you haven't already
# install.packages(c("tidyverse", "tidytext", "lubridate"))

library(tidyverse)
library(tidytext)
library(lubridate)
# Sample dataset
reviews <- tibble(
  date = as.Date(c("2023-01-01", "2023-01-15", "2023-02-01", "2023-02-10", "2023-01-05", "2023-01-20", "2023-02-05")),
  product = c("Product A", "Product A", "Product B", "Product B", "Product A", "Product B", "Product A"),
  review = c("I love this product!", "It's okay, not great.", "Worst experience ever.", 
             "Pretty good overall.", "Amazing!", "Not what I expected.", "Fantastic value!")
)
# Sentiment analysis
sentiments <- get_sentiments("bing")

# Tokenize reviews and analyze sentiment
sentiment_scores <- reviews %>%
  unnest_tokens(word, review) %>%
  inner_join(sentiments, by = "word") %>%
  count(date, product, sentiment = sentiment) %>%
  spread(sentiment, n, fill = 0) %>%
  mutate(sentiment_score = positive - negative)

# Aggregate sentiment scores over time
sentiment_trends <- sentiment_scores %>%
  group_by(date, product) %>%
  summarise(sentiment_score = sum(sentiment_score)) %>%
  ungroup()


# Visualization
ggplot(sentiment_trends, aes(x = date, y = sentiment_score, color = product)) +
  geom_line(size = 1) +
  labs(title = "Sentiment Trends Over Time",
       x = "Date",
       y = "Sentiment Score",
       color = "Product") +
  theme_minimal()
