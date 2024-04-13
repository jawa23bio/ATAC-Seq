# ATACseq

## Methods

ATACseq samples, comprising two replicates from a human source, were obtained for analysis. The dataset lacks a control, which is typical for ATACseq experiments. The analysis pipeline was initiated with quality control (QC) and adapter trimming, employing FastQC (v0.12.0) and Trimmomatic (v0.32) respectively. Subsequently, reads were aligned to the human reference genome (hg38) using Bowtie2 (v2.5.3) with the -X 2000 flag to facilitate efficient alignment. Alignments to the mitochondrial chromosome were removed using SAMtools (v1.19.2). To mitigate bias induced by the tagmentation process, reads were subjected to read shifting using the `alignmentSieve` function in deeptools (v3.5.6). Following read processing, fragment size distributions were analyzed using ATACSeqQC (v1.26.0) for quality control assessment. Peak calling was performed utilizing MACS3 (v3.0.1) with default parameters for ATACseq for each replicate and a single set of reproducible peaks was generated using the `intersect` function in bedtools (v.2.31.0). Peaks falling within blacklisted regions were filtered out to enhance data reliability. Peak annotation was conducted using HOMER (v4.11) to associate peaks with nearby genes and genomic features. Motif analysis on reproducible peaks was executed using MEME Suite (v5.5.5). Signal coverage plots centered on the transcription start site (TSS) for nucleosome-free regions (NFR) and nucleosome-bound regions (NBR) were generated using PlotProfile. Furthermore, visualization of peaks was facilitated using Integrative Genomics Viewer (IGV) for confirmation and exploration of the identified genomic regions.

## Questions to Address
Briefly remark on the quality of the sequencing reads and the alignment statistics, make sure to specifically mention the following:
  - Are there any concerning aspects of the quality control of your sequencing reads?
  - Are there any concerning aspects of the quality control related to alignment?
  - Based on all of your quality control, will you exclude any samples from further analysis?

After alignment, quickly calculate how many alignments were generated from each sample in total and how many alignments were against the mitochondrial chromosome
  - Report the total number of alignments per sample
  - Report the number of alignments against the mitochondrial genome

After performing peak calling analysis, generating a set of reproducible peaks and filtering peaks from blacklisted regions, please answer the following:
  - How many peaks are present in each of the replicates?
  - How many peaks are present in your set of reproducible peaks? What strategy did you use to determine “reproducible” peaks?
  - How many peaks remain after filtering out peaks overlapping blacklisted regions?

After performing motif analysis and gene enrichment on the peak annotations, please answer the following:
  - Briefly discuss the main results of both of these analyses
  - What can chromatin accessibility let us infer biologically?


## Deliverables
1. Produce a fragment length distribution plot for each of the samples

2. Produce a table of how many alignments for each sample before and after filtering alignments falling on the mitochondrial chromosome

3. Create a signal coverage plot centered on the TSS (plotProfile) for the nucleosome-free regions (NFR) and the nucleosome-bound regions (NBR)
    - You may consider fragments (<100bp) to be those from the NFR and the rest as the NBR.

4. A table containing the number of peaks called in each replicate, and the number of reproducible peaks

5. A single BED file containing the reproducible peaks you determined from the experiment.

6. Perform motif finding on your reproducible peaks
    - Create a single table / figure with the most interesting results

7. Perform a gene enrichment analysis on the annotated peaks using a well-validated gene enrichment tool
    - Create a single table / figure with the most interesting results

8. Produce a figure that displays the proportions of regions that appear to have accessible chromatin called as a peak (Promoter, Intergenic, Intron, Exon, TTS, etc.)
