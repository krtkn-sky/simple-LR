dataset = read.csv('score.csv')

library(caTools)
set.seed(123)
split = sample.split(dataset$AvgTestScores, SplitRatio=2/3)
training_set = subset(dataset,split==TRUE)
test_set = subset(dataset,split==FALSE)


# SIMPLE LINEAR REGRESSION #


regressor = lm(formula=AvgTestScores ~ YearsEducation,
data=training_set)
