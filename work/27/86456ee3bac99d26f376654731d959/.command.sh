#!/bin/bash -ue
/home/nayan/miniconda3/envs/bnf/bin/bcftools mpileup -f chr22.fa sample_sorted.bam | bcftools call -mv -o variants.vcf
