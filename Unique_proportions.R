setwd('/projectnb/bf528/students/jawa/bf528-individual-project-jawa23bio/')

# Load required libraries
library(ggplot2)
library(dplyr)

# Read annotation results into a data frame
# Assuming your file is tab-separated
annotation_results <- read.table("results/ATAC_annotated.txt", header = TRUE, stringsAsFactors = FALSE, sep = "\t")
annotation_results

# Extract the Annotation column and remove data in brackets
annotations <- gsub("\\(.*\\)", "", annotation_results$Annotation)

# Find unique annotations and count occurrences
unique_annotations <- table(annotations)
unique_annotations
# Calculate proportions
total_peaks <- sum(unique_annotations)
proportions <- (unique_annotations / total_peaks)*100

# Create a data frame with unique annotations and proportions
data <- data.frame(Annotation = names(proportions), Proportion = proportions)
data
# Create bar plot
gg <- ggplot(data, aes(x = Annotation, y = proportions)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(title = "Proportions of Unique Annotations",
       x = "Annotation", y = "Proportion")

# Save plot as PNG file
ggsave("Unique_proportions_plot.png", plot = gg, width = 8, height = 6, units = "in", dpi = 300)
