# Session 2: The Data Frame & Digital Sample Management
# Instructor: Dr. Gu Haogao
# Date: 2026-01-07

# ---------------------------------------------------------
# Concept 2: Input / Output (I/O)
# ---------------------------------------------------------
# Reading Data: The "Sample Reception" window.
# We assign the data to a variable named 'lis_data'
lis_data <- read.csv("data/mock_LIS_data.csv")

# ---------------------------------------------------------
# Inspecting the "Sample Receipt"
# ---------------------------------------------------------
# Check the dimensions (Rows x Columns)
dim(lis_data)

# View the first 6 rows (Header check)
head(lis_data)

# Inspect Structure (The MRI scan)
# Check if 'Result_Value' is numeric or character
str(lis_data)

# ---------------------------------------------------------
# Concept 3: Indexing (The Coordinate System)
# ---------------------------------------------------------
# [Row, Column]
# Row 1, Column 2
print(lis_data[1, 2])

# Row 1 (All columns) - Pulling one patient's full file
print(lis_data[1, ])

# Column 2 (All rows) - Pulling the 'Age' vector
print(lis_data[ , 2])

# The Dollar Sign $ (The "Quick Grab")
# Selecting a column by Name
print(lis_data$Result_Value)

# ---------------------------------------------------------
# Practice: Basic Stats on Frames
# ---------------------------------------------------------
# Note: If Result_Value is character (due to "."), this might fail or need conversion first.
# Let's check the class first
class(lis_data$Result_Value)

# If it is character, we need to clean it (covered in Data Cleaning section below)

# ---------------------------------------------------------
# Concept 4: Logical Subsetting (The Filter)
# ---------------------------------------------------------
# Goal: Select all rows WHERE Result > 40 (assuming numeric for now, or after cleaning)

# ---------------------------------------------------------
# Data Cleaning: The "Error" Text & Handling NAs
# ---------------------------------------------------------
# Scenario: Someone typed "." or "Error" in a numeric column.
# Fix: Coercion. "Error" becomes NA.
lis_data$Result_Value <- as.numeric(lis_data$Result_Value)

# Check the structure again
str(lis_data)

# Handling NAs in calculations
# mean(lis_data$Result_Value) -> returns NA
mean_val <- mean(lis_data$Result_Value, na.rm = TRUE)
print(paste("Mean ALT:", mean_val))

# ---------------------------------------------------------
# Creating the Mask (Logical Vector)
# ---------------------------------------------------------
# Step 1: Create a Logical Vector (True/False)
# We want High (> 40) AND Not NA
is_high <- (lis_data$Result_Value > 40) & !is.na(lis_data$Result_Value)

# Step 2: Apply the mask
high_risk_patients <- lis_data[is_high, ]
print(high_risk_patients)

# ---------------------------------------------------------
# Complex Logic (AND / OR)
# ---------------------------------------------------------
# Scenario: Male patients AND High Results
criteria <- (lis_data$Gender == "M") & (lis_data$Result_Value > 40) & !is.na(lis_data$Result_Value)
target_group <- lis_data[criteria, ]
print(target_group)

# ---------------------------------------------------------
# Concept 5: Writing Data (Output)
# ---------------------------------------------------------
# Export the filtered list
write.csv(target_group, "Critical_Report.csv", row.names = FALSE)
