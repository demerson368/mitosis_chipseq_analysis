#!/bin/bash
#BSUB -J downsample_after_remove_unmapped_and_duplicates
#BSUB -e downsample_after_remove_unmapped_and_duplicates.%J.error
#BSUB -R "span[hosts=1]" 
#BSUB -M 30720

for file in $(ls CTCF-Noc0h-Rep*_onlymapped_sorted_noduplicates.sam);do
	FILENAME=$(echo ${file##*/})
	BASENAME=$(echo ${FILENAME%.sam})
	if [ -e "../align/${BASENAME}_downsampled.sam" ]
	then
		echo "${BASENAME}_downsampled.sam found."
	
	else
		echo "${BASENAME}_downsampled.sam not found."
		bsub -M 30720 -R "span[hosts=1]" python downsample_samfile_pulldown_CTCF_reps_0min.py ${BASENAME}.sam ${BASENAME}_downsampled.sam
       	fi
done

for file in $(ls Rad21-Noc0h-Rep*_onlymapped_sorted_noduplicates.sam);do
    FILENAME=$(echo ${file##*/})
    BASENAME=$(echo ${FILENAME%.sam})
    if [ -e "../align/${BASENAME}_downsampled.sam" ]
    then
        echo "${BASENAME}_downsampled.sam found."
    
    else
        echo "${BASENAME}_downsampled.sam not found."
        bsub -M 30720 -R "span[hosts=1]" python downsample_samfile_pulldown_Rad21_reps_0min.py ${BASENAME}.sam ${BASENAME}_downsampled.sam
        fi  
done



for file in $(ls Input*0h_onlymapped_sorted_noduplicates.sam);do
	FILENAME=$(echo ${file##*/})
	BASENAME=$(echo ${FILENAME%.sam})
	if [ -e "../align/${BASENAME}_0minexp_downsampled.sam" ]
	then
		echo "${BASENAME}_0minexp_downsampled.sam found."
	else
		echo "${BASENAME}_0minexp_downsampled.sam not found."
		bsub -M 30720 -R "span[hosts=1]" python downsample_samfile_input_0minexp.py ${BASENAME}.sam ${BASENAME}_0minexp_downsampled.sam
	fi
done

