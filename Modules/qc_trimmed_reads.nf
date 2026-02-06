process QC_TRIMMED_READS {
    tag "trimmed_qc"
    publishDir "${params.outdir}/fatsqc/trimmed",mode : 'symlink'

    input : 
    path trimmed 

    output:
    path "*_fastqc.{html,zip}"

    script:
    """

    ${params.fastqc} ${trimmed}
    """ 
}