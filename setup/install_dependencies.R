# Standard Setup Protocol
# This script installs necessary packages for the course.
# It checks if a package is installed before trying to install it to save time.

print("Starting Standard Setup Protocol...")

# 1. Install CRAN packages
cran_packages <- c("tidyverse", "ggplot2", "dplyr", "readr", "rmarkdown")

for (pkg in cran_packages) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    print(paste("Installing", pkg, "..."))
    install.packages(pkg, quiet = TRUE)
  } else {
    print(paste(pkg, "is already installed."))
  }
}

# 2. Install Bioconductor (if needed for future sessions)
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager", quiet = TRUE)

# Example Bioconductor package check (can be expanded)
# if (!requireNamespace("Biostrings", quietly = TRUE)) {
#     BiocManager::install("Biostrings", quiet = TRUE)
# }

print("Setup Protocol Complete. Environment is ready.")
