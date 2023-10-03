# Load the necessary libraries
library(caTools)
library(ggplot2)

# Read the dataset
dataset = read.csv('score.csv')

# Set the seed for reproducibility
set.seed(123)

# Split the dataset into training and test sets
split = sample.split(dataset$AvgTestScores, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# SIMPLE LINEAR REGRESSION #

regressor = lm(formula = AvgTestScores ~ YearsEducation, data = training_set)

# Predicting the test set results
y_pred = predict(regressor, newdata = test_set)

# Visualising model performance on training set
training_plot <- ggplot() +
  geom_point(aes(x = training_set$YearsEducation, y = training_set$AvgTestScores), colour = 'red') +
  geom_line(aes(x = training_set$YearsEducation, y = predict(regressor, newdata = training_set)), colour = 'blue') +
  ggtitle('Education vs Test scores (Training set)') +
  xlab('Years of Education') +
  ylab('Test Scores')

# Save the training plot as a PNG file
ggsave("training_plot.png", plot = training_plot)

# Visualising model performance on test set
test_plot <- ggplot() +
  geom_point(aes(x = test_set$YearsEducation, y = test_set$AvgTestScores), colour = 'red') +
  geom_line(aes(x = test_set$YearsEducation, y = predict(regressor, newdata = test_set)), colour = 'blue') +
  ggtitle('Education vs Test scores (Test set)') +
  xlab('Years of Education') +
  ylab('Test Scores')

# Save the test plot as a PNG file
ggsave("test_plot.png", plot = test_plot)
