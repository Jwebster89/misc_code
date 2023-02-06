library(ggplot2)
library(reshape2)

df = read.table("Project_times.tsv", header = TRUE, sep="\t")
df_long <- melt(df, id.vars = c("Status", "FTE"), variable.name="year", value.name="time_commitment")

df_long$Status <- factor(df_long$Status, levels = c("P", "A"))

ggplot(df_long, aes(x=year, y=time_commitment, fill=Status))+
  geom_bar(stat="identity", position="stack")+
  ggtitle("Time Commitements for Active and Pending Projects")+
  scale_fill_manual(values= c("A"= "green", "P"="blue"), labels= c("Active", "Pending"))+
  scale_x_discrete(labels=c("22/23","23/24", "24/25", "25/26", "26/27","27/28"))
