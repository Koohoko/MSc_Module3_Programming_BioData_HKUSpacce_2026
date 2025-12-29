# Session 2: The Data Frame & Digital Sample Management
# Instructor: Dr. Gu Haogao
# Date: Jan 2026

# ---------------------------------------------------------
# Slide 5: Reading Data (Input)
# ---------------------------------------------------------
# The function to read comma-separated values
# Note: Ensure the file is in your working directory or provide full path
lis_data <- read.csv("data/mock_patient_data.csv")

# Check the dimensions (Rows, Columns)
dim(lis_data)

# ---------------------------------------------------------
# Slide 6: Inspecting the "Sample Receipt"
# ---------------------------------------------------------
# View the first 6 rows (Header check)
head(lis_data)

# Check column names
colnames(lis_data)

# ---------------------------------------------------------
# Slide 7: Indexing - The "96-Well Plate" Coordinate System
# ---------------------------------------------------------
# [Row, Column]
# Row 1, Column 2
print(lis_data[1, 2])

# All Rows, Column 2 (The whole vector)
# print(lis_data[ , 2])

# The specific column named "Age"
# print(lis_data$Age)

# ---------------------------------------------------------
# Slide 8: Logical Subsetting (The "Filter")
# ---------------------------------------------------------
# Step 1: Create a logical mask (TRUE/FALSE)
is_positive <- lis_data$Status == "Positive"

# Step 2: Apply mask to the dataframe
positive_patients <- lis_data[is_positive, ]

# View the result
print(positive_patients)

# ---------------------------------------------------------
# Slide 9: Saving Results (Output)
# ---------------------------------------------------------
# Write the filtered data to a NEW file
write.csv(positive_patients, "positive_report.csv", row.names = FALSE)
