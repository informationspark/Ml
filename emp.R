# Step 1: Create the dataset
employee_data <- data.frame(
  Employee_ID = c(101,101, 102, 103, 104, 105),
  Name = c("John Doe","John Doe", "Jane Smith", "Michael Johnson", "Emily Brown", "David Wilson"),
  Department = c("HR","Finance", "Finance", "IT", "Marketing", "Operations"),
  Salary = c(50000,NA , 70000, NA, 65000,70000),
  Mobile_Number = c("1234567890","1234567890", "9876543210", "4567890123", "7890123456", "2345678901")
)

# Step 2: Preprocess the dataset
# In this example, we don't have any preprocessing steps since the dataset is clean.
mean_sal<-mean(employee_data$Salary,na.rm = TRUE)

employee_data$Salary[is.na(employee_data$Salary)]<-mean_sal
  
# View the dataset
print(employee_data)

# Remove duplicate rows based on Employee_ID and Name columns
employee_data_unique <- employee_data[!duplicated(employee_data[c("Employee_ID", "Name")]), ]

# View the dataset after removing duplicates
print(employee_data_unique)

# View the dataset after removing duplicates
print(employee_data)

