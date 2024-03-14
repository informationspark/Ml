# Create and sort a Vector in ascending and descending order
my_vector <- c(10, 5, 8, 2, 12)
sorted_asc <- sort(my_vector)  # Sort in ascending order
sorted_desc <- sort(my_vector, decreasing = TRUE)  # Sort in descending order

# Print the sorted vectors
cat("Sorted in ascending order:", sorted_asc, "\n")
cat("Sorted in descending order:", sorted_desc, "\n\n")

# Create a list of data frames
# Sample data frames
df1 <- data.frame(ID = 1:3, Value = c(10, 20, 30))
df2 <- data.frame(ID = 4:6, Value = c(40, 50, 60))
df3 <- data.frame(ID = 7:9, Value = c(70, 80, 90))

# Create a list containing these data frames
list_of_dfs <- list(df1, df2, df3)

# Access each data frame from the list and print it
for (i in seq_along(list_of_dfs)) {
  cat("Data Frame", i, ":\n")
  print(list_of_dfs[[i]])
}

# Draw a 3D plot for the white wine dataset (example)
# This requires a 3D dataset, but for demonstration, let's plot a simple 3D scatter plot
library(scatterplot3d)

# Sample data
x <- c(1, 2, 3, 4, 5)
y <- c(6, 7, 8, 9, 10)
z <- c(11, 12, 13, 14, 15)

# Create the 3D scatter plot
scatterplot3d(x, y, z, main = "3D Scatter Plot", xlab = "X", ylab = "Y", zlab = "Z")
