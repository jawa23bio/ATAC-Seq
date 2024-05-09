# ATACseq

## Methods
ATAC-seq samples, consisting of two replicates from a human source, were subjected to a comprehensive analysis pipeline. The analysis commenced with quality control (QC) and adapter trimming using FastQC (v0.12.0) and Trimmomatic (v0.39), respectively. The reads were then aligned to the human reference genome (hg38) using Bowtie2 (v2.5.3), with the -X 2000 flag utilized to optimize alignment efficiency. To ensure data integrity, alignments to the mitochondrial chromosome were filtered out using SAMtools (v1.19.2). Additionally, to mitigate bias introduced during the tagmentation process, a read-shifting step was performed using deeptools (v3.5.6). Following read processing, fragment size distributions were assessed using ATACSeqQC using the `atacseqqc.R` script for quality control evaluation. Peak calling was conducted separately for each replicate using MACS3 (v3.0.1) with default parameters tailored for ATAC-seq data. To generate a set of reproducible peaks, peaks called from individual replicates were intersected using the intersect function in bedtools (v2.31.1). Furthermore, peaks falling within blacklisted regions were filtered out to enhance the reliability of the dataset. Peak annotation was performed using HOMER (v4.11) to associate peaks with nearby genes and genomic features with their proportions being calculated and visualized using the `Unique_proportions.R` script. Motif analysis was conducted on the reproducible peaks using MEME Suite (v5.5.5) to identify enriched sequence motifs. Lastly, signal coverage plots centered on the transcription start site (TSS) were generated for nucleosome-free regions (NFR) and nucleosome-bound regions (NBR) with PlotProfile from deeptools.

## Questions to Address - Addressed in the `Final Report.Rmd` file
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

## References
1. [https://github.com/CebolaLab/ATAC-seq](https://github.com/CebolaLab/ATAC-seq?tab=readme-ov-file)
2. https://github.com/BioinfGuru/memeMotifs?tab=readme-ov-file
3. http://barcwiki.wi.mit.edu/wiki/SOPs/atac_Seq
4. https://bioconductor.org/packages/devel/bioc/vignettes/ATACseqQC/inst/doc/ATACseqQC.html#Introduction
5. https://snakemake.readthedocs.io/en/stable/snakefiles/rules.html
6. Yan, F., Powell, D.R., Curtis, D.J. et al. From reads to insight: a hitchhiker’s guide to ATAC-seq data analysis. Genome Biol 21, 22 (2020). https://doi.org/10.1186/s13059-020-1929-3
7. Andrews, S. (2010). FastQC:  A Quality Control Tool for High Throughput Sequence Data [Online]. Available online at: http://www.bioinformatics.babraham.ac.uk/projects/fastqc/
8. Bolger, A. M., Lohse, M., & Usadel, B. (2014). Trimmomatic: a flexible trimmer for Illumina sequence data. Bioinformatics (Oxford, England), 30(15), 2114–2120. https://doi.org/10.1093/bioinformatics/btu170
9. Langmead, B., & Salzberg, S. L. (2012). Fast gapped-read alignment with Bowtie 2. Nature methods, 9(4), 357–359. https://doi.org/10.1038/nmeth.1923
10. Li, H., Handsaker, B., Wysoker, A., Fennell, T., Ruan, J., Homer, N., Marth, G., Abecasis, G., Durbin, R., & 1000 Genome Project Data Processing Subgroup (2009). The Sequence Alignment/Map format and SAMtools. Bioinformatics (Oxford, England), 25(16), 2078–2079. https://doi.org/10.1093/bioinformatics/btp352
11. Ramírez, F., Dündar, F., Diehl, S., Grüning, B. A., & Manke, T. (2014). deepTools: a flexible platform for exploring deep-sequencing data. Nucleic acids research, 42(Web Server issue), W187–W191. https://doi.org/10.1093/nar/gku365
13. Ou J, Liu H, Yu J, Kelliher MA, Castilla LH, Lawson ND, Zhu LJ (2018). “ATACseqQC: a Bioconductor package for post-alignment quality assessment of ATAC-seq data.” BMC Genomics, 19(1), 169. ISSN 1471-2164, doi:10.1186/s12864-018-4559-3, https://doi.org/10.1186/s12864-018-4559-3.
14. Zhang, Y., Liu, T., Meyer, C.A. et al. Model-based Analysis of ChIP-Seq (MACS). Genome Biol 9, R137 (2008). https://doi.org/10.1186/gb-2008-9-9-r137
15. Heinz, S., Benner, C., Spann, N., Bertolino, E., Lin, Y. C., Laslo, P., Cheng, J. X., Murre, C., Singh, H., & Glass, C. K. (2010). Simple combinations of lineage-determining transcription factors prime cis-regulatory elements required for macrophage and B cell identities. Molecular cell, 38(4), 576–589. https://doi.org/10.1016/j.molcel.2010.05.004
16. Timothy L. Bailey, James Johnson, Charles E. Grant, William S. Noble, The MEME Suite, Nucleic Acids Research, Volume 43, Issue W1, 1 July 2015, Pages W39–W49, https://doi.org/10.1093/nar/gkv416
