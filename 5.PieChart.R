company <- c("A", "B", "C", "D")
market_share <- c(20, 30, 25, 25)
pie(market_share, 
    labels = company, 
    main = "Market Share by Company", 
    col = c("lightblue", "lightgreen", "orange", "pink"))
legend("topright", 
       legend = company, 
       fill = c("lightblue", "lightgreen", "orange", "pink"))
