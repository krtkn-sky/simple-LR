dataset = read.csv('score.csv')

library(caTools)
set.seed(123)
split = sample.split(dataset$AvgTestScores, SplitRatio=2/3)
training_set = subset(dataset,split==TRUE)
test_set = subset(dataset,split==FALSE)


# SIMPLE LINEAR REGRESSION #


regressor = lm(formula=AvgTestScores ~ YearsEducation,
data=training_set)

#predicting the test set results

y_pred = predict(regressor,newdata= test_set)

# Visualising model performance on training set

library(ggplot2)

ggplot() +

geom_point(aes(x=training_set$YearsEducation,
y=training_set$AvgTestScores),
colour = 'red') +

geom_line(aes(x=training_set$YearsEducation,
y = predict(regressor,newdata= training_set)),
colour = 'blue') +

ggtitle('Education vs Test scores (Training set)')+
xlab('Years of Education') +
ylab('Test Scores')


# Visualising model performance on t set

library(ggplot2)

ggplot() +

geom_point(aes(x=test_set$YearsEducation,
y=test_set$AvgTestScores),
colour = 'red') +

geom_line(aes(x=test_set$YearsEducation,
y = predict(regressor,newdata= test_set)),
colour = 'blue') +

ggtitle('Education vs Test scores (Training set)')+
xlab('Years of Education') +
ylab('Test Scores')

