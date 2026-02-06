#!/bin/bash -ue
/home/nayan/miniconda3/envs/bnf/bin/samtools sort sample.bam -o sample_sorted.bam
/home/nayan/miniconda3/envs/bnf/bin/samtools index sample_sorted.bam
