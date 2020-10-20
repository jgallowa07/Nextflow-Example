find . -name .cache | xargs rm -rf
find . -name '.nextflow*' | xargs rm -rf  
find . -name '.node-nextflow*' | xargs rm -rf  
find . -name 'work' | xargs rm -rf
find . -name 'my-results' | xargs rm -rf 
rm -rf commands
rm -rf merged_files
rm -rf fastqc_output
