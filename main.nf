#!/usr/bin/env nextflow

process getSecret {
    container 'python:3.9.17'
    output:
      path secret_file

    script:
    """
    pip3 install boto3
    aws-secrets.py $params.secret_name $params.region_name > secret_file
    """
}

process showSecret {
    input:
      path secret_file
    output:
      stdout

    script:
    """
    cat ${secret_file}
    """
}

workflow {
   getSecret | showSecret | view
}
