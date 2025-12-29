# Session 1: The R Environment & Statistical Forensics
# Instructor: Dr. Gu Haogao
# Date: Jan 5, 2026

# ---------------------------------------------------------
# Concept 1: Variables are "Test Tubes"
# ---------------------------------------------------------
# In the lab, you never hold liquid in your hands; you put it in a labeled tube.
# In R, a 'Variable' is that tube. We use the arrow `<-` to pour the value.

patient_glucose <- 5.5
print(patient_glucose)

# Note: x = 5.5 works, but <- is the R standard.

# ---------------------------------------------------------
# Concept 2: Vectors are "Batch Runs"
# ---------------------------------------------------------
# Rarely do we run just one sample. We run a batch.
# The `c()` function stands for "Combine" or "Concatenate".

qc_level1 <- c(5.5, 5.6, 5.4, 5.5)
print(qc_level1)

# ---------------------------------------------------------
# Concept 3: Vectorization (The Multi-Channel Pipette)
# ---------------------------------------------------------
# Math in R applies to the whole batch at once.
# If I want to convert units for 100 samples, I don't do it one by one.

# Convert mg/dL to mmol/L (Example conversion factor)
# Let's say the values above were mmol/L, but if we had mg/dL:
qc_level1_mgdl <- c(99, 101, 97, 99)
qc_level1_mmol <- qc_level1_mgdl * 0.0555

print(qc_level1_mmol)

# ---------------------------------------------------------
# Concept 4: Functions are "Instruments"
# ---------------------------------------------------------
# You don't need to know the math formula for Standard Deviation.
# You just need to know which instrument to use.

# Calculate Mean
mean_val <- mean(qc_level1)
print(paste("Mean:", mean_val))

# Calculate Standard Deviation
sd_val <- sd(qc_level1)
print(paste("SD:", sd_val))

# Rounding
print(round(sd_val, digits=2))

# ---------------------------------------------------------
# Concept 5: Data Types (The "Sample Type")
# ---------------------------------------------------------
# Numeric: Ct values, OD, Concentration
num_var <- 5.5

# Character: Patient ID, Gender (Must use quotes!)
char_var <- "Positive"

# Logical: True/False
bool_var <- TRUE

# Warning: Don't mix types in one vector!
# mixed_vector <- c(5.5, "Positive") # This will convert everything to text.
