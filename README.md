Variant Calling Pipeline using Nextflow
# Introduction

Variant calling is a key step in NGS data analysis used to identify genetic variations such as SNPs and small insertions/deletions by comparing sequencing reads against a reference genome.

This repository contains a Nextflow-based variant calling pipeline that automates the complete workflow starting from raw FASTQ files and ending with variant detection.
The pipeline is modular, reproducible, and scalable, making it suitable for learning, academic projects, and real-world bioinformatics workflows.

# Basic Workflow of the Pipeline

The pipeline follows this standard variant calling workflow:

Quality control of raw reads

Read trimming

Quality control of trimmed reads

Alignment to reference genome

SAM to BAM conversion

BAM sorting and indexing

Variant calling

QC summary using MultiQC

# Project Directory Structure
├── .nextflow/                 # Nextflow internal files
├── data/                      # Input sequencing data
│   └── sample1.fastq
├── modules/                   # Individual Nextflow modules
│   ├── qc_raw_reads.nf
│   ├── read_trimming.nf
│   ├── qc_trimmed_reads.nf
│   ├── read_alignment.nf
│   ├── sam_to_bam.nf
│   ├── bam_sort_index.nf
│   ├── variant_calling.nf
│   └── multiqc.nf
├── references/                # Reference genome
│   └── chr22.fa
├── results/                   # Final output files
├── work/                      # Nextflow working directory
├── workflows/                 # Workflow definition
│   └── workflow.nf
├── environment.yml            # Conda environment
├── main.nf                    # Pipeline entry point
├── nextflow.config            # Nextflow configuration
└── README.md

# Software & Requirements

Nextflow

Conda / Miniconda

Tools installed via Conda:

FastQC

Trimmomatic / Cutadapt

BWA / HISAT2

SAMtools

bcftools / GATK

MultiQC

# Environment Setup

Create the Conda environment using the provided file:

conda env create -f environment.yml
conda activate variant_pipeline


# Make sure Conda support is enabled in nextflow.config.

# Input Files
Sequencing Data

Place raw FASTQ files inside the data/ folder:

data/sample1.fastq

Reference Genome

Place the reference genome inside the references/ folder:

references/chr22.fa


# The reference genome must be indexed before alignment.

# How to Run the Pipeline

Run the pipeline from the project root directory:

nextflow run main.nf


To resume the pipeline after interruption:

nextflow run main.nf -resume

# Step-by-Step Pipeline Explanation
# Quality Control of Raw Reads

Module: qc_raw_reads.nf
FastQC is used to assess raw read quality, GC content, and adapter contamination.

# Read Trimming

Module: read_trimming.nf
Low-quality bases and adapter sequences are removed to improve downstream analysis.

# Quality Control of Trimmed Reads

Module: qc_trimmed_reads.nf
FastQC is run again to confirm quality improvement after trimming.

# Read Alignment

Module: read_alignment.nf
Trimmed reads are aligned to the reference genome (chr22.fa).

# SAM to BAM Conversion

Module: sam_to_bam.nf
SAM files are converted to BAM format using SAMtools.

# BAM Sorting and Indexing

Module: bam_sort_index.nf
BAM files are sorted and indexed for efficient access.

# Variant Calling

Module: variant_calling.nf
Variants such as SNPs and indels are identified from the processed BAM files.

# MultiQC Report

Module: multiqc.nf
All QC outputs are combined into a single MultiQC report.

# Output Files

1.FastQC reports (raw and trimmed)

2.Trimmed FASTQ files

3.Sorted & indexed BAM files

4.Variant (VCF) files

5.MultiQC HTML report

# How to Clone This Repository
git clone https://github.com/your-username/variant-calling-pipeline.git
cd variant-calling-pipeline

# How to Push This Project to GitHub
git init
git add .
git commit -m "Initial commit: Nextflow variant calling pipeline"
git branch -M main
git remote add origin https://github.com/your-username/variant-calling-pipeline.git
git push -u origin main


##  Important Points

- The pipeline must be executed from the project root directory.
- Input FASTQ files should be placed inside the `data/` folder.
- The reference genome (`chr22.fa`) must be indexed before alignment.
- File paths and parameters should be verified in `nextflow.config`.
- The `-resume` option can be used to continue incomplete runs.
- Intermediate files are stored in the `work/` directory.
- The `.nextflow/` directory contains Nextflow internal metadata.
- Each analysis step is implemented as a separate Nextflow module.
