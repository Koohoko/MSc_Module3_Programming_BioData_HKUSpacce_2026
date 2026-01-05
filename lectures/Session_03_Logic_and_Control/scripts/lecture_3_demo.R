# Session 3: Logic and Control Flow
# Instructor: Dr. Gu Haogao
# Date: 2026-01-12

# ---------------------------------------------------------
# Slide 4: Boolean Logic
# ---------------------------------------------------------
# This is a logical type
qc_pass <- TRUE
flag_error <- FALSE

print(qc_pass)
print(class(qc_pass))

# ---------------------------------------------------------
# Slide 6: Practice - Asking R Questions
# ---------------------------------------------------------
hb_a1c <- 7.2

# Ask: Is the patient diabetic?
print(hb_a1c > 6.5)
# Output: [1] TRUE

# Ask: Is the patient normal?
print(hb_a1c < 5.7)
# Output: [1] FALSE

# ---------------------------------------------------------
# Slide 9: The Conditional 'if'
# ---------------------------------------------------------
potassium <- 7.5

if (potassium > 6.0) {
   print("CRITICAL ALERT: CALL WARD")
}

# Try changing potassium to 4.0 and run again
# potassium <- 4.0
# if (potassium > 6.0) { ... }

# ---------------------------------------------------------
# Slide 10: The Alternative 'else'
# ---------------------------------------------------------
if (potassium > 6.0) {
   print("Critical")
} else {
   print("Release Result")
}

# ---------------------------------------------------------
# Slide 11: The Clinical Ladder 'else if'
# ---------------------------------------------------------
temp <- 38.0

if (temp > 39) {
   print("High Fever")
} else if (temp > 37.5) {
   print("Mild Fever")
} else {
   print("Afebrile")
}

# ---------------------------------------------------------
# Slide 14 & 15: Loops
# ---------------------------------------------------------
# Basic Loop
for (i in 1:5) {
   print(paste("Processing Sample #", i))
}

# Looping through a vector
batch_results <- c(5.5, 6.2, 4.8)

for (result in batch_results) {
   print(result * 10)
}

# ---------------------------------------------------------
# Slide 17: The Auto-Verifier Pattern (Logic + Loop)
# ---------------------------------------------------------
results <- c(5.5, 7.2, 5.8)

for (val in results) {
   if (val > 7.0) {
      print("Critical")
   } else {
      print("OK")
   }
}

# ---------------------------------------------------------
# Slide 18: Storing Results
# ---------------------------------------------------------
# Initialize empty vector
flags <- c()

for (i in 1:3) {
   # Append result to the bucket
   flags[i] <- "Computed_Status"
}
print(flags)

# ---------------------------------------------------------
# Slide 19: Functions
# ---------------------------------------------------------
check_sugar <- function(val) {
   if (val > 6.5) { return("Diabetes") }
   else { return("Normal") }
}

# Apply function
patient_A <- 7.1
diagnosis <- check_sugar(patient_A)
print(diagnosis)
