process QC_RAW_READS {
   
   publishDir "${params.outdir}/fastqc/raw",mode:'symlink'

   input:
   path fastq

   output:
   path "*_fastqc.*"

   script:
   """
   ${params.fastqc} ${fastq}
   """
} 