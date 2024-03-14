# Create two matrices
matrix1 <- matrix(1:9, nrow = 3, ncol = 3)
matrix2 <- matrix(11:19, nrow = 3, ncol = 3)

# Define column and row names
colnames(matrix1) <- c("A", "B", "C")
rownames(matrix1) <- c("X", "Y", "Z")

colnames(matrix2) <- c("D", "E", "F")
rownames(matrix2) <- c("P", "Q", "R")
matrix1
matrix2
# Access the element at 3rd column and 1st row
element <- matrix1[1, 3]
element

# Arrange elements sequentially by column
sequential_elements <- c(matrix1, matrix2)
sequential_elements

# Add and Subtract two matrices
addition_result <- matrix1 + matrix2
subtraction_result <- matrix1 - matrix2
addition_result
subtraction_result

# Print the results
cat("Matrix 1:\n")
print(matrix1)

cat("\nMatrix 2:\n")
print(matrix2)

cat("\nElement at 3rd column and 1st row of Matrix 1:", element, "\n")

cat("\nSequential elements by column:\n")
print(sequential_elements)

cat("\nAddition of Matrix 1 and Matrix 2:\n")
print(addition_result)

cat("\nSubtraction of Matrix 1 and Matrix 2:\n")
print(subtraction_result)

