for file in $(ls ../CTCF_mitosis_fastq/120min/CTCF*Rep*.fastq);do
	FILENAME=$(echo ${file##*/})
	BASENAME=$(echo ${FILENAME%.fastq})
	if [ -e "../CTCF_mitosis_fastq/120min/$BASENAME.sam" ]
	then
 		echo "${BASENAME}.sam found."
	else
		echo "${BASENAME}.sam not found."

		bsub -o ${BASENAME}_bowtie_alignment.log -n 8 -M 30720 -R "span[hosts=1]" bowtie /project/jcreminslab/reference_genomes/bowtie/mm9/mm9 ../CTCF_mitosis_fastq/120min/$FILENAME --tryhard --time --sam -p8 -S -m2 $BASENAME.sam
       	fi
done
