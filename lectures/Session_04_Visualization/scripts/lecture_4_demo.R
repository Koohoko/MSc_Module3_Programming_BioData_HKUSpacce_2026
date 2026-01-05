# Session 4: Visualizing Clinical Data (The Clinical Dashboard)
# Instructor: Dr. Gu Haogao
# Date: 2026-01-19

# ---------------------------------------------------------
# Setup: Load library & data
# ---------------------------------------------------------
# install.packages("ggplot2") # Run once if needed
library(ggplot2)

qc_data <- read.csv("../data/daily_qc_trend.csv")
qc_data$Date <- as.Date(qc_data$Date)

# ---------------------------------------------------------
# The ggplot2 template (Data + Aesthetics + Geometry)
# ---------------------------------------------------------
# Minimal template
basic_point <- ggplot(qc_data, aes(x = Date, y = Result)) +
  geom_point()

# ---------------------------------------------------------
# Geom 1: Histogram (distribution)
# ---------------------------------------------------------
hist_default <- ggplot(qc_data, aes(x = Result)) +
  geom_histogram()

hist_polished <- ggplot(qc_data, aes(x = Result)) +
  geom_histogram(binwidth = 0.1, fill = "navy", color = "white")

# ---------------------------------------------------------
# Geom 2: Boxplot (comparing groups)
# ---------------------------------------------------------
box_by_instrument <- ggplot(qc_data, aes(x = Instrument, y = Result, fill = Instrument)) +
  geom_boxplot()

# ---------------------------------------------------------
# Geom 3: Scatter (correlation)
# ---------------------------------------------------------
# Example placeholder columns (replace with real columns if available)
# ggplot(df, aes(x = Age, y = Viral_Load)) + geom_point()

# ---------------------------------------------------------
# Geom 4: Line plot (time series / Levey-Jennings)
# ---------------------------------------------------------
lj_basic <- ggplot(qc_data, aes(x = Date, y = Result)) +
  geom_line() +
  geom_point()

# ---------------------------------------------------------
# Layering thresholds (context lines)
# ---------------------------------------------------------
lj_with_limits <- lj_basic +
  geom_hline(yintercept = 5.0, color = "black") +
  geom_hline(yintercept = 5.4, color = "red", linetype = "dashed") +
  geom_hline(yintercept = 4.6, color = "red", linetype = "dashed")

# ---------------------------------------------------------
# Mapping color to data (legend auto-created)
# ---------------------------------------------------------
lj_colored <- ggplot(qc_data, aes(x = Date, y = Result, color = Instrument)) +
  geom_line() +
  geom_point()

# ---------------------------------------------------------
# Faceting (small multiples per instrument)
# ---------------------------------------------------------
lj_faceted <- ggplot(qc_data, aes(x = Date, y = Result)) +
  geom_line() +
  geom_point() +
  facet_wrap(~ Instrument)

# ---------------------------------------------------------
# Themes (publication-ready) & labels
# ---------------------------------------------------------
lj_clean <- lj_faceted +
  geom_hline(yintercept = 5.0, color = "black") +
  geom_hline(yintercept = 5.4, color = "red", linetype = "dashed") +
  geom_hline(yintercept = 4.6, color = "red", linetype = "dashed") +
  theme_bw() +
  labs(title = "Monthly Levey-Jennings Chart",
       x = "Date",
       y = "Glucose Level (mmol/L)")

# ---------------------------------------------------------
# Saving plots (export instead of screenshot)
# ---------------------------------------------------------
# ggsave("QC_Dashboard_Jan2026.png", lj_clean, width = 8, height = 5)
# ggsave("QC_Dashboard_Jan2026.pdf", lj_clean, width = 10, height = 6)
