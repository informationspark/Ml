library(rpart.plot, quietly = TRUE)
library(rpart)

# Read the mushroom dataset
mushrooms <- read.csv("mushrooms.csv")

# Display the structure of the dataset
str(mushrooms)

# Number of rows in the dataset
nrow(mushrooms)

# Number of rows with missing values
nrow(mushrooms) - sum(complete.cases(mushrooms))

# Remove the 'veil.class' column from the dataset
mushrooms$veil.class <- NULL

# Display the 'veil.class' column to verify removal
mushrooms$veil.class

# Create a frequency table of 'class' vs 'odor'
table(mushrooms$class, mushrooms$odor)

# Calculate the number of perfect splits for each feature
number.perfect.splits <- apply(X = mushrooms[-1], MARGIN = 2, FUN = function(col) {
  t <- table(mushrooms$class, col)
  sum(t == 0)
})

# Create a barplot showing the number of perfect splits vs feature
barplot(number.perfect.splits,
        main = "Number of perfect splits vs feature",
        xlab = "", ylab = "Feature", las = 2, col = "wheat")

# Set seed for reproducibility
set.seed(12345)

# Create training set indices
train <- sample(1:nrow(mushrooms), 
                size = ceiling(0.80 * nrow(mushrooms)), 
                replace = FALSE)

# Training set
mushrooms_train <- mushrooms[train,]

# Test set
mushrooms_test <- mushrooms[-train,]

# Penalty matrix
penalty.matrix <- matrix(c(0, 1, 10, 0), 
                         byrow = TRUE, 
                         nrow = 2)


# Build the decision tree model
tree <- rpart(class ~ .,
              data = mushrooms_train,
              parms = list(loss = penalty.matrix),
              method = "class")

# Plot the decision tree
rpart.plot(tree, nn = TRUE)

# Testing the model
pred <- predict(object = tree, mushrooms_test[-1], type = "class")

# Calculating accuracy
t <- table(mushrooms_test$class, pred)
t
