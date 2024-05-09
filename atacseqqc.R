# Load BiocManager
library(BiocManager)

library(ATACseqQC)

# Define input and output file paths
input_bam <- snakemake@input$bam_file
output_frag_size_plot <- snakemake@output$frag_size_plot
output_library_complexity_plot <- snakemake@output$library_complexity_plot

# Perform bamQC
bamQC_result <- bamQC(
  input_bam,
  index = input_bam,
  mitochondria = "chrM",
  outPath = sub(".bam", ".clean.bam", basename(input_bam)),
  doubleCheckDup = TRUE
)

# Save the bamQC object
saveRDS(bamQC_result, output_bamQC_results)

# Estimate Library complexity
library_complexity <- estimateLibComplexity(readsDupFreq(input_bam))

# Generate fragment size distribution plot
frag_size_plot <- fragSizeDist(input_bam, basename(input_bam))

# Save the fragment size plot
png(output_frag_size_plot)
frag_size_plot
dev.off()

# Generate library complexity plot
png(output_library_complexity_plot)
plot(library_complexity)
dev.off()
