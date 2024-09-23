# Install required packages if not already installed
# install.packages("igraph")
# install.packages("ggraph")

library(igraph)
library(ggraph)
# Simulating a directed graph where users interact (e.g., follow or like each other)
edges <- data.frame(
  from = c("User1", "User1", "User2", "User3", "User4", "User4", "User5", "User5"),
  to = c("User2", "User3", "User4", "User4", "User5", "User3", "User2", "User1")
)

# Create a graph object
g <- graph_from_data_frame(edges, directed = TRUE)

# Visualize the graph structure
plot(g, vertex.size=30, vertex.label.cex=1, edge.arrow.size=0.5)
# Calculate degree centrality
degree_centrality <- degree(g, mode = "all")

# Print degree centrality values
degree_centrality
# Calculate betweenness centrality
betweenness_centrality <- betweenness(g, directed = TRUE)

# Print betweenness centrality values
betweenness_centrality
# Calculate closeness centrality
closeness_centrality <- closeness(g, mode = "all")

# Print closeness centrality values
closeness_centrality
# Set vertex size based on degree centrality
V(g)$size <- degree_centrality * 5

# Set vertex color based on degree centrality
V(g)$color <- ifelse(degree_centrality > 1, "red", "lightblue")

# Plot the graph with degree centrality
plot(g, vertex.label.color="black", vertex.frame.color="gray", edge.arrow.size=0.5)

# Using ggraph for advanced visualization
ggraph(g, layout = "fr") + 
  geom_edge_link(aes(edge_alpha = 0.8), arrow = arrow(length = unit(4, 'mm'))) + 
  geom_node_point(aes(size = degree_centrality, color = betweenness_centrality)) +
  geom_node_text(aes(label = name), repel = TRUE) + 
  scale_size_continuous(range = c(3, 10)) + 
  scale_color_continuous(low = "lightblue", high = "red") +
  theme_void() +
  labs(title = "Social Network with Centrality Metrics",
       size = "Degree Centrality", color = "Betweenness Centrality")
