product<-c("A","B","C","D","E")
sales<-c(300,450,500,350,400)
barplot(sales, 
        names.arg=product, 
        main="Sales by Product",
        xlab="Product", 
        ylab="Sales", 
        col="skyblue", 
        border="black",
        ylim=c(0, 600))
