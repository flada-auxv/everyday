library(ggplot2)

pdf("figure4-8.pdf")
data <- read.table("simulation3-1.csv", header=TRUE, sep=",")
df <- data.frame(table(data$X70))
colnames(df) <- c("queue_size", "frequency")
percent_labels <- paste(df$frequency, '\n(', round(df$frequency*100/540, 2), '%)')

ggplot(data=df) + opts(legend.position = "none") + scale_fill_grey(start = 0.5, end = 0.8) + 
  geom_bar(aes(x = queue_size, y = frequency, fill = factor(queue_size))) +
  geom_text(aes(x = queue_size, y = frequency, label = percent_labels, size=1)) +
  scale_y_continuous("frequency") +
  scale_x_discrete("queue size")

print(df)