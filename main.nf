#!/usr/bin/env nextflow
nextflow.enable.dsl=2

process scriptTask {
    var ver
    var commid
    output:
      stdout

    script:  
    """
    commid=$workflow.commitId
    ver=${workflow.revision:=commid}
    echo " Workflow Version		: $workflow.version"
    echo " Workflow CommitId         : $workflow.commitId"
    echo " VER Variable         : $ver
    """
}

workflow {
  scriptTask() | view
}
