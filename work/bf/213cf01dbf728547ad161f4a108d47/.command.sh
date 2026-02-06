#!/bin/bash -ue
/usr/bin/bcftools mpileup -f chr22.fa sample_sorted.bam | bcftools call -mv -o variants.vcf
