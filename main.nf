#!/usr/bin/env nextflow
nextflow.enable.dsl=2

process scriptTask {
    var rev
    output:
      stdout

    script:  
    """
    rev=${workflow.revision:=\$workflow.commitId}
    echo " Version		: $workflow.revision"
    echo " CommitId         : $workflow.commitId"
    echo " Comm or Ver      : $rev"
    """
}

workflow {
  scriptTask() | view
}
