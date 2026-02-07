# Variant Calling Pipeline using Nextflow

## Introduction

Variant calling is a key step in next-generation sequencing (NGS) data analysis used to identify genetic variations such as single nucleotide polymorphisms (SNPs) and small insertions/deletions (INDELs) by comparing sequencing reads against a reference genome.

This repository contains a **Nextflow-based variant calling pipeline** that automates the complete workflow starting from raw FASTQ files and ending with variant detection. The pipeline is **modular, reproducible, and scalable**, making it suitable for learning purposes, academic projects, and real-world bioinformatics workflows.

The workflow is implemented using **Nextflow DSL2**, with each analysis step written as an independent reusable module.

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
8. Quality control summary using MultiQC  

---

## Project Structure

```
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
```

---

## Software and Requirements

### Core Requirements

- Nextflow  
- Conda / Miniconda  

### Bioinformatics Tools (installed via Conda)

- FastQC  
- Trimmomatic / Cutadapt  
- BWA / HISAT2  
- SAMtools  
- bcftools / GATK  
- MultiQC  

---

## Environment Setup

Create the Conda environment using the provided configuration file:

```bash
conda env create -f environment.yml
conda activate variant_pipeline
```

Ensure that Conda support is enabled in `nextflow.config`.

---

## Input Files

### Sequencing Data

Place raw FASTQ files inside the `data/` directory:

```
data/sample1.fastq
```

### Reference Genome

Place the reference genome inside the `references/` directory:

```
references/chr22.fa
```

The reference genome must be indexed before running the alignment step.

---

## How to Run the Pipeline

Run the pipeline from the project root directory:

```bash
nextflow run main.nf
```

To resume the pipeline after interruption:

```bash
nextflow run main.nf -resume
```

---

## Step-by-Step Pipeline Explanation

### Quality Control of Raw Reads
**Module:** `qc_raw_reads.nf`  
FastQC is used to evaluate raw read quality, GC content, and adapter contamination.

### Read Trimming
**Module:** `read_trimming.nf`  
Low-quality bases and adapter sequences are removed to improve downstream analysis.

### Quality Control of Trimmed Reads
**Module:** `qc_trimmed_reads.nf`  
FastQC is run again to confirm quality improvement after trimming.

### Read Alignment
**Module:** `read_alignment.nf`  
Trimmed reads are aligned to the reference genome (`chr22.fa`).

### SAM to BAM Conversion
**Module:** `sam_to_bam.nf`  
SAM files are converted to BAM format using SAMtools.

### BAM Sorting and Indexing
**Module:** `bam_sort_index.nf`  
BAM files are sorted and indexed for efficient access.

### Variant Calling
**Module:** `variant_calling.nf`  
Variants such as SNPs and small INDELs are identified from the processed BAM files.

### MultiQC Report
**Module:** `multiqc.nf`  
All quality control results are combined into a single MultiQC report.

---

## Output Files

1. FastQC reports (raw and trimmed)  
2. Trimmed FASTQ files  
3. Sorted and indexed BAM files  
4. Variant (VCF) files  
5. MultiQC HTML report  

All output files are stored in the `results/` directory.

---

## How to Clone This Repository

```bash
git clone https://github.com/your-username/variant-calling-pipeline.git
cd variant-calling-pipeline
```

---

## How to Push This Project to GitHub

```bash
git init
git add .
git commit -m "Initial commit: Nextflow variant calling pipeline"
git branch -M main
git remote add origin https://github.com/your-username/variant-calling-pipeline.git
git push -u origin main
```

---

## Important Notes

- The pipeline must be executed from the project root directory.
- Input FASTQ files should be placed inside the `data/` directory.
- The reference genome must be indexed before alignment.
- File paths and parameters should be verified in `nextflow.config`.
- The `-resume` option allows continuation of incomplete runs.
- Intermediate files are stored in the `work/` directory.
- The `.nextflow/` directory contains internal Nextflow metadata.
- Each analysis step is implemented as a separate Nextflow module.
