#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process firstLayer {
  publishDir "${params.outdir}/out/", mode: 'copy'
  input: 
    multiqc1 = Channel.fromPath("${projectDir}/resources/MultiQC Report.html")
    report1 = Channel.fromPath("${projectDir}/resources/report.pdf")
  output:
    tuple path(multiqc1), path(report1)
  script:
    """
    sleep 5;
    echo "Copying and testing 2 layer for reports"
    """
}

process secondLayer {
  publishDir "${params.outdir}/out/2/", mode: 'copy'
  input: 
    multiqc2 = Channel.fromPath("${projectDir}/resources/MultiQC Report.html")
    report2 = Channel.fromPath("${projectDir}/resources/report.pdf")
  output:
    tuple path(multiqc2), path(report2)
  script:
    """
    sleep 5;
    echo "Copying and testing 2 layer for reports"
    """
}

workflow {
  firstLayer |
  secondLayer
}
