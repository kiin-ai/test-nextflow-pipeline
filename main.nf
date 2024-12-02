#!/usr/bin/env nextflow

nextflow.enable.dsl=2

process sayHello {
  publishDir params.outdir, mode: 'copy'
  
  input: 
    val x
  output:
    path "greeting.txt"
  script:
    """
    echo '$x world!' > greeting.txt
    """
}

workflow {
  params.outdir = "results"
  
  Channel.of('Bonjour', 'Ciao', 'Hello', 'Hola') | sayHello
}
