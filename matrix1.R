# Find the minimum and maximum value in a Vector
my_vector <- c(5, 8, 3, 12, 6)
min_value <- min(my_vector)
max_value <- max(my_vector)

# Print the minimum and maximum values
cat("Minimum value:", min_value, "\n")
cat("Maximum value:", max_value, "\n\n")

# Concatenate two matrices of the same column but different rows
# Create two matrices
matrix1 <- matrix(1:6, nrow = 2)
matrix2 <- matrix(7:12, nrow = 2)

# Concatenate the matrices
concatenated_matrix <- rbind(matrix1, matrix2)

# Print the concatenated matrix
cat("Concatenated Matrix:\n")
print(concatenated_matrix)
cat("\n")

# Add 10 to each element of the first vector in a given list
given_list <- list(vector1 = c(1, 5, 9), vector2 = c(2, 6, 10))

# Add 10 to each element of the first vector
modified_list <- lapply(given_list, function(x) {
  if (identical(x, given_list[[1]])) {
    x + 10
  } else {
    x
  }
})

# Print the modified list
cat("Modified List:\n")
print(modified_list)
cat("\n")

# Draw a boxplot with dots for all elements of a given list
# Sample data for boxplot
boxplot_data <- list(A = c(1, 2, 3, 4, 5), B = c(3, 4, 5, 6, 7))

# Draw the boxplot with dots
boxplot(boxplot_data, pch = 16, col = "blue", main = "Boxplot with Dots")
