#!/usr/bin/env nextflow
nextflow.enable.dsl=2 
params.outdir = 'results'


process publishMe {
  publishDir params.outdir, mode: 'copy', failOnError: 'true' 
  input: 
    val x
  output:
    path("*.txt") 
  script:
    """
    echo '$x world!'
    dd if=/dev/zero of=1G_1.txt bs=1 count=0 seek=3G
    dd if=/dev/zero of=1G_2.txt bs=1 count=0 seek=3G
    dd if=/dev/zero of=1G_3.txt bs=1 count=0 seek=3G
    dd if=/dev/zero of=1G_4.txt bs=1 count=0 seek=3G
    dd if=/dev/zero of=1G_5.txt bs=1 count=0 seek=3G
    dd if=/dev/zero of=1G_6.txt bs=1 count=0 seek=3G
    dd if=/dev/zero of=1G_7.txt bs=1 count=0 seek=3G
    dd if=/dev/zero of=1G_8.txt bs=1 count=0 seek=3G
    dd if=/dev/zero of=1G_9.txt bs=1 count=0 seek=3G
    dd if=/dev/zero of=1G_10.txt bs=1 count=0 seek=3G
    dd if=/dev/zero of=1G_11.txt bs=1 count=0 seek=3G
    dd if=/dev/zero of=1G_12.txt bs=1 count=0 seek=3G
    dd if=/dev/zero of=1G_13.txt bs=1 count=0 seek=3G
    dd if=/dev/zero of=1G_14.txt bs=1 count=0 seek=3G
    dd if=/dev/zero of=1G_15.txt bs=1 count=0 seek=3G
    sleep 10;
    """
}

process sayHello2 {
  publishDir params.outdir
  input:
    val x
  output:
    path("*.txt")
  script:
    """
    echo "Minimal example" > example_output_1000.txt
    sleep 100;
    """
}


workflow {
  Channel.of('pub') 
    | publishMe
    | view
}
