## load data
mtcars

## split data 70:30
set.seed(42)
n <- nrow(mtcars)
id <- sample(1:n, size = 0.7 * n)
train_df <- mtcars[id, ]
test_df <- mtcars[-id, ]

## train
set.seed(42)
lm_model <- train(mpg ~ hp + wt + am,
                  data = train_df,
                  method = "lm") ## train อยู่ใน Caret

knn_model <- train(mpg ~ hp + wt + am,
                  data = train_df,
                  method = "knn")


## score
p <- predict(lm_model, newdata = test_df)
p_knn <- predict(knn_model, newdata = test_df)

## evaluate
error <- test_df$mpg - p
mae <- mean(abs(test_df$mpg - p))
mse <-  mean(error**2)
rmse <- sqrt(mse)

