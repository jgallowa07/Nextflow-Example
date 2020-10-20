params.index = "$baseDir/Data/index.csv"

Channel
    .fromPath(params.index)
    .splitCsv(header:true)
    .map{ row-> tuple("${row.sampleId}", 
        file("${baseDir}/Data/${row.read1}"), 
        file("${baseDir}/Data/${row.read2}"))}
    .set { samples_ch }

process append_paired_reads {

    publishDir "${baseDir}/merged_files/"

    input:
        tuple sampleId, read1, read2 from samples_ch

    output:
        tuple sampleId, file("${sampleId}-merged-reads.fq") into append_channel

    script:
        """
        zcat $read1 $read2 > ${sampleId}-merged-reads.fq
        """
}

append_channel.into{append_1; append_2}
append_2.subscribe{}

process quality_control {

    container 'quay.io/biocontainers/fastqc:0.11.9--0'

    publishDir "${baseDir}/fastqc_output/"

    input:
        tuple sampleId, file(merged_reads) from append_1

    output:
       file("${output_name}") into finish

    exec:
        
        base_name = "${merged_reads}" - ~/\.\w+$/
        output_name = "${base_name}_fastqc.html"

    script:
        """
        fastqc -t 4 ${merged_reads}
        """
}
