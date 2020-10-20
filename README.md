# Nextflow Pipeline Example

This repo contains some example code for building a Nextflow pipeline.
The example shows some csv defining the filepath for paired-end mates across a set of 5 samples.
There are three scripts which iteratively build a pipeline which creates a channel to parse the
csv, append the paired-end mates, then run fastqc in a container on the merged reads for each sample. 

# To Run

Install [Docker](https://docs.docker.com/get-docker/) and [Nextflow](https://www.nextflow.io/docs/latest/getstarted.html)
```
which nextflow && which docker
```
should produce something like:
```
/usr/local/bin/nextflow
/usr/bin/docker
```

Clone the repo
```
git clone git@github.com:jgallowa07/Nextflow-Example.git && cd Nextflow-Example
```

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

# Rhino

To run on a SLURM cluster, set up for gizmo:
First, log onto to the cluster and clone the repo
```
git clone git@github.com:jgallowa07/Nextflow-Example.git && cd Nextflow-Example
```

Next, grab an interactive node
```
(base) rhino03 ~ » kinit
Password for jgallowa@FHCRC.ORG: 
(base) rhino03 ~ » grabnode
How many CPUs/cores would you like to grab on the node? [1-36] 12
How much memory (GB) would you like to grab? [240] 12
Please enter the max number of days you would like to grab this node: [1-7] 1
Do you need a GPU ? [y/N]N
```

Finally, run the script
```
./run_gizmo
```






