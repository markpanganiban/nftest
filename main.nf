#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process firstLayer {
  publishDir "${params.outdir}/out/", mode: 'copy'
  input: 
    path(multiqc1) from Channel.value("${projectDir}/resources/MultiQC Report.html")
    path(report1) from Channel.value("${projectDir}/resources/report.pdf")
  output:
    tuple path(multiqc1),
    path(report1) into publish_ch
  script:
    """
    sleep 5;
    echo "Copying and testing 2 layer for reports"
    """
}

process secondLayer {
  publishDir "${params.outdir}/out/2/", mode: 'copy'
  input: 
    path(multiqc2) from Channel.value("${projectDir}/resources/MultiQC Report.html")
    path(report2) from Channel.value("${projectDir}/resources/report.pdf")
  output:
    tuple path(multiqc2),
    path(report2) into publish_ch
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
