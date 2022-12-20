#!/usr/bin/env nextflow
nextflow.enable.dsl=2

process scriptTask {
    var rev
    output:
      stdout

    script:  
    """
    [ -z $workflow.revision ] && workflow.revision = $workflow.commitId
    echo " Version		: $workflow.revision"
    echo " CommitId         : $workflow.commitId"
    """
}

workflow {
  scriptTask() | view
}
