#!/bin/bash
#BSUB -J downsample_after_remove_unmapped_and_duplicates
#BSUB -e downsample_after_remove_unmapped_and_duplicates.%J.error
#BSUB -R "span[hosts=1]" 
#BSUB -M 30720

for file in $(ls merge*CTCF*Reps*_onlymapped_sorted_noduplicates*.sam);do
	FILENAME=$(echo ${file##*/})
	BASENAME=$(echo ${FILENAME%.sam})
	if [ -e "../align/${BASENAME}_downsampled.sam" ]
	then
 		echo "${BASENAME}_downsampled.sam found."
	
	else
		echo "${BASENAME}_downsampled.sam not found."
		bsub -M 30720 -R "span[hosts=1]" python downsample_samfile_pulldown_CTCF_rep_merge.py ${BASENAME}.sam ${BASENAME}_downsampled.sam
       	fi
done

for file in $(ls merge*Rad21*Reps*_onlymapped_sorted_noduplicates*.sam);do
    FILENAME=$(echo ${file##*/})
    BASENAME=$(echo ${FILENAME%.sam})
    if [ -e "../align/${BASENAME}_downsampled.sam" ]
    then
        echo "${BASENAME}_downsampled.sam found."
    
    else
        echo "${BASENAME}_downsampled.sam not found."
        bsub -M 30720 -R "span[hosts=1]" python downsample_samfile_pulldown_Rad21_rep_merge.py ${BASENAME}.sam ${BASENAME}_downsampled.sam
        fi  
done



for file in $(ls Input-Asyn*_onlymapped_sorted_noduplicates.sam);do
	FILENAME=$(echo ${file##*/})
	BASENAME=$(echo ${FILENAME%.sam})
	if [ -e "../align/${BASENAME}_downsampled.sam" ]
	then
		echo "${BASENAME}_downsampled.sam found."
	else
		echo "${BASENAME}_downsampled.sam not found."
		bsub -M 30720 -R "span[hosts=1]" python downsample_samfile_input.py ${BASENAME}.sam ${BASENAME}_downsampled.sam
	fi
done

