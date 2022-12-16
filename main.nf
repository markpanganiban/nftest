nextflow.enable.dsl=2

params.email = 'mark.panganiban@seqera.io'

process someTask {
  secret 'FOO'
  output: 
     stdout 
  script:
  '''
    echo "Secrets phrase: $FOO"
  '''
}

workflow {
  someTask().view()
}


workflow.onComplete {
    def msg = """\
        Pipeline execution summary
        ---------------------------
        Completed at: ${workflow.complete}
        Duration    : ${workflow.duration}
        Success     : ${workflow.success}
        workDir     : ${workflow.workDir}
        exit status : ${workflow.exitStatus}
        """
        .stripIndent()

    sendMail(to: params.email, from: params.email, subject: 'My pipeline execution', body: msg)
}
