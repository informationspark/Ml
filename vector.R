#1.	Write a R program to
#Create two vectors and perform arithmetic operations. 
#Modify a specific element in a vector using subscript operator, 
#logical indexing and function



# Create two vectors
vector1 <- c(1, 2, 3, 4, 5)
vector2 <- c(6, 7, 8, 9, 10)

# Perform arithmetic operations
sum_result <- vector1 + vector2
diff_result <- vector1 - vector2
prod_result <- vector1 * vector2
div_result <- vector1 / vector2

# Print results
cat("Sum:", sum_result, "\n")
cat("Difference:", diff_result, "\n")
cat("Product:", prod_result, "\n")
cat("Division:", div_result, "\n")

# Modify specific elements in a vector using subscript operator
vector1[3] <- 10  # Modify third element to 10
cat("Modified vector1:", vector1, "\n")

# Modify specific elements using logical indexing
vector2[vector2 > 7] <- 0  # Modify elements greater than 7 to 0
cat("Modified vector2:", vector2, "\n")

# Modify specific elements using a function
modify_element <- function(vector, index, value) {
  vector[index] <- value
  return(vector)
}

vector1 <- modify_element(vector1, 5, 15)  # Modify fifth element to 15
cat("Modified vector1 using function:", vector1, "\n")

