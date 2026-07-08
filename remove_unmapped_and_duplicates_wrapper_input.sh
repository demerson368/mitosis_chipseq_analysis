#!/bin/bash
#BSUB -n 8
#BSUB -J remove_unmapped_and_duplicates
#BSUB -e remove_unmapped_and_duplicates.%J.error
#BSUB -R "span[hosts=1]" 
#BSUB -M 30720

for file in $(ls Input-Noc*.sam);do
	FILENAME=$(echo ${file##*/})
	BASENAME=$(echo ${FILENAME%.sam})
	if [ -e "../align/${BASENAME}_onlymapped_sorted_noduplicates.sam" ]
	then
 		echo "${BASENAME}_onlymapped_sorted_noduplicates.sam found."
	else
		echo "${BASENAME}_onlymapped_sorted_noduplicates.sam not found."

		bsub -n 8 -M 30720 -R "span[hosts=1]" sh remove_unmapped_and_duplicates.sh ${BASENAME}

       	fi
done
