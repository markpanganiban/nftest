#!/usr/bin/env nextflow
nextflow.enable.dsl=2

process scriptTask {
    var rev
    output:
      stdout

    script:  
    """
    rev = $workflow.revision
    [ -z $workflow.revision ] && rev = $workflow.commitId
    echo " Version		: $workflow.revision"
    echo " CommitId         : $workflow.commitId"
    echo " VER          : $rev"
    """
}

workflow {
  scriptTask() | view
}
