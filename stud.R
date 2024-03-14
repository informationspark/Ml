# Create a data frame for students' mark list
student_marks <- data.frame(
  Math = c(),
  Science = c(),
  English = c(),
  History = c(),
  Geography = c()
)

# Convert the data frame columns to numeric
student_marks[] <- lapply(student_marks, as.numeric)

student_marks

# Find min, max, and range from the dataset
min_marks <- apply(student_marks, 2, min)
max_marks <- apply(student_marks, 2, max)
range_marks <- max_marks - min_marks

# Find variance, quartile, and standard deviation
variance_marks <- apply(student_marks, 2, var)
quartile_marks <- var(student_marks)
standard_deviation_marks <- apply(student_marks, 2, sd)
quartile_marks
# Find IQR and summarize the dataset


summary_marks <- summary(student_marks)

# Visualize using histogram
par(mfrow = c(2, 3)) # Arrange plots in a 2x3 grid

for (col in colnames(student_marks)) {
  hist(student_marks[[col]], main = col, xlab = "Marks", col = "skyblue")
}

# Visualize using 3D plot (scatterplot3d package required)
install.packages("scatterplot3d")  # Uncomment and run if you haven't installed the package yet

library(scatterplot3d)
scatterplot3d(student_marks$Math, student_marks$Science, student_marks$English, main="Student Marks", xlab="Math", ylab="Science", zlab="English", color="blue")
