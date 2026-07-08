samtools view -F 4 -h $1.sam > $1_onlymapped.sam

samtools view -Shu $1_onlymapped.sam > $1_onlymapped.bam

samtools sort $1_onlymapped.bam $1_onlymapped_sorted

samtools-1.3.1/bin/samtools rmdup -s $1_onlymapped_sorted.bam $1_onlymapped_sorted_noduplicates.bam

samtools view -h $1_onlymapped_sorted_noduplicates.bam > $1_onlymapped_sorted_noduplicates.sam

samtools flagstat $1_onlymapped_sorted_noduplicates.bam > $1_onlymapped_sorted_noduplicates.flagstat

#rm $1_onlymapped.sam
rm $1_onlymapped.bam
#rm $1_onlymapped_sorted.bam
rm $1_onlymapped_sorted_noduplicates.bam
