params.index = "$baseDir/Data/index.csv"

Channel
    .fromPath(params.index)
    .splitCsv(header:true)
    .map{ row -> tuple(
        "${row.sampleId}", 
        file("${baseDir}/Data/${row.read1}"), 
        file("${baseDir}/Data/${row.read2}")
        )
    }
    .set { samples_ch }

samples_ch.subscribe{println it}
