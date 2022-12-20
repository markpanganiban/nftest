#!/usr/bin/env nextflow
nextflow.enable.dsl=2

process scriptTask {
    var rev
    output:
      stdout

    script:  
    """
    echo " Version		: \$\{workflow.revision:=workflow.commitId}"
    echo " CommitId         : $workflow.commitId"
    """
}

workflow {
  scriptTask() | view
}
