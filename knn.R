credit<-read.csv("credit_data.csv")
str(credit)
library(caret)
library(ggplot2)
# Subset the dataset to include only relevant columns
credit_subset <- credit[, c('Creditability', 'Account.Balance', 'Purpose', 'Credit.Amount', 'Length.of.current.employment', 'Age..years.', 'Sex...Marital.Status', 'Occupation')]

# Define a normalization function
normalize <- function(x) {
  return((x - min(x)) / (max(x) - min(x)))
}

# Normalize the subset of the credit dataset
credit_subset_n <- as.data.frame(lapply(credit_subset[, -1], normalize))
credit_subset_n
# Split the dataset into training and testing sets
set.seed(123)
train_indices <- sample(1:nrow(credit_subset_n), size = nrow(credit_subset_n) * 0.7, replace = FALSE)

train_data <- credit_subset_n[train_indices, ]
test_data <- credit_subset_n[-train_indices, ]

train_data
test_data


train_labels <- credit_subset[train_indices, 1]
test_labels <- credit_subset[-train_indices, 1]

train_labels
test_labels


# Train the KNN model with optimal k value
optimal_k <- 10  # Assuming optimal k value is 10 (determined from the accuracy vs. k plot)
knn_model <- knn(train = train_data[, -1], test = test_data[, -1], cl = train_labels, k = optimal_k)

# Predict loan approval for test data
predictions <- knn_model

plot(k.optm,type='b',xlab='k feature',ylab='accuracy',col="red",borders(colour = "yellow"))

# Compare predictions with actual labels
accuracy <- mean(predictions == test_labels)
cat("Accuracy:", accuracy, "\n")



