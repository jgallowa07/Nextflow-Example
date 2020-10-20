# Nextflow Pipeline Example

This repo contains some example code for building a Nextflow pipeline.
The example shows some csv defining the filepath for paired-end mates across a set of 5 samples.
There are three scripts which iteratively build a pipeline which creates a channel to parse the
csv, append the paired-end mates, then run fastqc in a container on the merged reads for each sample. 

# To Run

Install [Docker](https://docs.docker.com/get-docker/) and [Nextflow](https://www.nextflow.io/docs/latest/getstarted.html)

running hello-channel:
```
nextflow run hello-channel.nf
```

running hello-process:
```
nextflow run hello-process.nf
```

running hello-container:
```
nextflow run -c compute_config/nextflow.local.config hello-container.nf
```

To run on a SLURM cluster, set up for gizmo:
First, log onto to the cluster and clone the repo
```

```
