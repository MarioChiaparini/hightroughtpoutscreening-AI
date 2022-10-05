#!/bin/bash -vl

DATA="/path/"

function action{
	name=${1##*\/}
	cd $1 
	ls *.tif -l -m1 | xargs -n1 -I{} echo $PWD'/'{} > DATA'/input/'/$name'.list'



./run_ilastik.sh --headless \
          --project=$PWD'/Spot_counter.lip'
 	  --export_source="simple"
	  --output_format=tiff
	  --output_filename_format={dataset_dir}/{nickname}"Simple segmentation.tiff"$(cat $DATA'/input/'$name'.list')
  }

export -f action
module load ilastik 

home=$PWD'/input/'

