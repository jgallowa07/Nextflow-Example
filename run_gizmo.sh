#!/bin/bash

set -e
source /app/lmod/lmod/init/profile

module load nextflow
module load Singularity
export PATH=$SINGULARITYROOT/bin/:$PATH

nextflow run \
    -c "compute_config/nextflow.gizmo.config" \
    -work-dir /fh/scratch/delete30/matsen_e/jgallowa/temp/work/ \
    hello-container.nf \
