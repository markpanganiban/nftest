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
    echo "SCRIPT Commit         : $workflow.commitId"
    """
}

process execTask {
    output:
      stdout
    exec:
    println "EXEC VERSION"
    println "EXEC Pipeline: $workflow.manifest.version"
    println "EXEC VERSION: $workflow.revision"
    println "EXEC COMMITID: $workflow.commitId"
}

workflow {
  scriptTask() | view
  execTask() | view
}
