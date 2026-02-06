include { QC_RAW_READS }      from '../Modules/qc_raw_reads'
include { READ_TRIMMING }      from '../Modules/read_trimming'
include { QC_TRIMMED_READS }  from '../Modules/qc_trimmed_reads'
include { READ_ALIGNMENT }     from '../Modules/read_alignment'
include { SAM_TO_BAM }      from '../Modules/sam_to_bam'
include { BAM_SORT_INDEX }  from '../Modules/bam_sort_index'
include { VARIANT_CALLING } from '../Modules/variant_calling'
include { MULTIQC }         from '../Modules/multiqc'


workflow MY_PIPELINE {
    take:
        fastq_input
        ref_input

    main:
        raw_qc = QC_RAW_READS(fastq_input)
        trimmed_fq = READ_TRIMMING(fastq_input)
        trimmed_qc = QC_TRIMMED_READS(trimmed_fq)
        aligned = READ_ALIGNMENT(trimmed_fq, ref_input)
        bam = SAM_TO_BAM(aligned)
        sorted_outputs = BAM_SORT_INDEX(bam)
        VARIANT_CALLING(sorted_outputs.sorted_bam,sorted_outputs.bai, ref_input)

        all_qc_logs = raw_qc.mix(trimmed_qc).collect()
        MULTIQC(all_qc_logs)
}
