#!/bin/bash


i=1
for file in $(ls Rad21-Noc4h*Rep*_noduplicates*.sam);do
    FILENAME=$(echo ${file##*/})
    BASENAME=$(echo ${FILENAME%.sam})

    samtools view -Shu ${BASENAME}.sam > ${BASENAME}.bam
    array[$i]=${BASENAME}.bam
    echo ${array[$i]}
    ((i++))
done

if [ $i -eq 4 ]
then
    echo ${array[1]}
    echo ${array[2]}
    echo ${array[3]}     
    REPS=$(($i-1))
    FILEINTERSET=$(echo ${array[1]})
    OUT=$(echo merge${REPS}_${FILEINTERSET/Rep[0-9]/Reps})
    OUT_SORTED=$(echo ${OUT%.bam}_sorted)
    OUT_SORTED_BAM=$(echo ${OUT_SORTED}.bam)
    OUT_SORTED_SAM=$(echo ${OUT_SORTED}.sam)
    #echo ${array[1]}
    #echo $OUT
    #echo $OUT_SORTED
    

    samtools merge -u $OUT ${array[1]} ${array[2]} ${array[3]} 
    samtools sort $OUT $OUT_SORTED
    samtools view -h $OUT_SORTED_BAM > $OUT_SORTED_SAM

    rm ${array[1]}
    rm ${array[2]}
    rm ${array[3]}
    rm $OUT_SORTED_BAM
    rm $OUT
elif [ $i -eq 3 ]
then
    echo ${array[1]}
    echo ${array[2]}
    REPS=$(($i-1))
    FILEINTERSET=$(echo ${array[1]})
    OUT=$(echo merge${REPS}_${FILEINTERSET/Rep[0-9]/Reps})
    OUT_SORTED=$(echo ${OUT%.bam}_sorted)
    OUT_SORTED_BAM=$(echo ${OUT_SORTED}.bam)
    OUT_SORTED_SAM=$(echo ${OUT_SORTED}.sam)
    #echo ${array[1]}
    #echo $OUT
    #echo $OUT_SORTED
    

    samtools merge -u $OUT ${array[1]} ${array[2]} 
    samtools sort $OUT $OUT_SORTED
    samtools view -h $OUT_SORTED_BAM > $OUT_SORTED_SAM

    rm ${array[1]}
    rm ${array[2]}
    rm $OUT_SORTED_BAM
    rm $OUT

fi

