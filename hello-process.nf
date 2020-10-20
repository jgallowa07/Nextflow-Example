params.index = "$baseDir/Data/index.csv"

Channel
    .fromPath(params.index)
    .splitCsv(header:true)
    .map{ row-> tuple("${row.sampleId}", 
        file("${baseDir}/Data/${row.read1}"), 
        file("${baseDir}/Data/${row.read2}"))}
    .set { samples_ch }

process append_paired_reads {

    publishDir "${baseDir}/merged_files/" mode: "copy"

    input:
        tuple (sampleId, read1, read2) from samples_ch

    output:
        tuple sampleId, file("${sampleId}-merged-reads.fq") into append_channel

    script:
        """
        zcat $read1 $read2 > ${sampleId}-merged-reads.fq
        """
}
