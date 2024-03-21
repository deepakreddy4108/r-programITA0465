library(datasets)
library(caret)
library(nnet)

data(iris)

set.seed(123)

index <- createDataPartition(iris$Species, p = 0.8, list = FALSE)
train_data <- iris[index, ]
test_data <- iris[-index, ]

log_reg_model <- multinom(Species ~ Petal.Width + Petal.Length, data = train_data)

predicted_probs <- predict(log_reg_model, newdata = test_data, type = "probs")

predicted_classes <- colnames(predicted_probs)[apply(predicted_probs, 1, which.max)]

conf_matrix <- table(predicted_classes, test_data$Species)

print(conf_matrix)