# Variant Calling Pipeline using Nextflow

## Introduction
Variant calling is a key step in NGS data analysis used to identify genetic variations such as SNPs and small insertions/deletions by comparing sequencing reads against a reference genome.

This repository contains a **Nextflow-based variant calling pipeline** that automates the complete workflow starting from raw FASTQ files and ending with variant detection. The pipeline is **modular, reproducible, and scalable**, making it suitable for learning, academic projects, and real-world bioinformatics workflows.

---

## Basic Workflow of the Pipeline
The pipeline follows a standard variant calling workflow:

1. Quality control of raw reads  
2. Read trimming  
3. Quality control of trimmed reads  
4. Alignment to reference genome  
5. SAM to BAM conversion  
6. BAM sorting and indexing  
7. Variant calling  
8. QC summary using MultiQC  

---

## Project Structure

```text
.
├── .nextflow/
├── data/
│   └── sample1.fastq
├── modules/
│   ├── qc_raw_reads.nf
│   ├── read_trimming.nf
│   ├── qc_trimmed_reads.nf
│   ├── read_alignment.nf
│   ├── sam_to_bam.nf
│   ├── bam_sort_index.nf
│   ├── variant_calling.nf
│   └── multiqc.nf
├── references/
│   └── chr22.fa
├── results/
├── work/
├── workflows/
│   └── workflow.nf
├── environment.yml
├── main.nf
├── nextflow.config
└── README.md



















