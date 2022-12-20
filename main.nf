#!/usr/bin/env nextflow
nextflow.enable.dsl=2

process scriptTask {
    output:
      stdout

    script:  
    """
    echo "SCRIPT VERSION"
    echo "SCRIPT Pipeline	: $workflow.manifest.version"
    echo "SCRIPT Version		: $workflow.revision"
    """
}

process execTask {
    output:
      stdout
    exec:
    println "EXEC VERSION"
    println "EXEC Pipeline: $workflow.manifest.version"
    println "EXEC VERSION: $workflow.revision"
}

workflow {
  scriptTask() | view
  execTask() | view
}
