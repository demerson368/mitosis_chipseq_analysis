bowtie version 0.12.7  
samtools Version: 1.3  
macs2 2.1.1.20160309  

Chip seq processing:  

chipseq files from CTCF_mitosis_fastq with fastqs separated by timepoint (0min, 25min, 60min, 120min, 240min) or Asyn.  

used CTCF samples:  


```
    1.  CTCF Asyn rep0  
    2.  CTCF Asyn rep1  
    3.  CTCF 0min rep0  
    4.  CTCF 0min rep1  
    5.  CTCF 0min rep2  
    6.  CTCF 25min rep5  
    7.  CTCF 25min rep6  
    8.  CTCF 60min rep1  
    9.  CTCF 60min rep2  
   10.  CTCF 120min rep1  
   11.  CTCF 120min rep2  
   12.  CTCF 240min rep1  
   13.  CTCF 240min rep2  
```

used Rad21 samples:  
  
```
    1.  Rad21 Asyn rep1  
    2.  Rad21 Asyn rep3  
    3.  Rad21 0min rep3  
    4.  Rad21 0min rep4  
    5.  Rad21 25min rep5  
    6.  Rad21 25min rep6  
    7.  Rad21 60min rep1  
    8.  Rad21 60min rep5  
    9.  Rad21 120min rep1  
   10.  Rad21 120min rep3  
   11.  Rad21 240min rep1  
   12.  Rad21 240min rep3  
```

# Step1: Alignment of each rep separately. run bowtie.   

```
    sh bowtie_Rad21_reps.sh  
    sh bowtie_CTCF_reps.sh  
    sh bowtie_25min_CTCF_reps.sh  
    sh bowtie_25min_Rad21_reps.sh  
    sh bowtie_60min_CTCF_reps.sh  
    sh bowtie_60min_Rad21_reps.sh  
    sh bowtie_120min_CTCF_reps.sh  
    sh bowtie_120min_Rad21_reps.sh  
    sh bowtie_240min_CTCF_reps.sh  
    sh bowtie_240min_Rad21_reps.sh  
```


# Step2:  PCR duplication filter per rep. 
Use samtools-1.3.1.  Assumes samtools pathway to this directory in remove_unmapped_and_duplicates.sh (line 8)     

```
    sh remove_unmapped_and_duplicates_wrapper_Asyn_input.sh  
    sh remove_unmapped_and_duplicates_wrapper_CTCF_reps.sh  
    sh remove_unmapped_and_duplicates_wrapper_input.sh  
    sh remove_unmapped_and_duplicates_wrapper_Rad21_reps.sh  
```

# Step3:  Merge reps per timepoint into single merged .sam file.  
Again samtools is used to convert .sam to .bam then sort then merge again.  

```
    sh convert_bam_merge_wrapper_Rad21_Asyn.sh  
    sh convert_bam_merge_wrapper_Rad21_0min.sh  
    sh convert_bam_merge_wrapper_Rad21_25min.sh  
    sh convert_bam_merge_wrapper_Rad21_60min.sh  
    sh convert_bam_merge_wrapper_Rad21_120min.sh  
    sh convert_bam_merge_wrapper_Rad21_240min.sh  
    sh convert_bam_merge_wrapper_CTCF_Asyn.sh  
    sh convert_bam_merge_wrapper_CTCF_0min.sh  
    sh convert_bam_merge_wrapper_CTCF_25min.sh  
    sh convert_bam_merge_wrapper_CTCF_60min.sh  
    sh convert_bam_merge_wrapper_CTCF_120min.sh  
    sh convert_bam_merge_wrapper_CTCF_240min.sh  
```
    
# Step4:  downsample merged reps per timepoint/Asyn, 
input background, and 0min replicates for Rad21 and CTCF.  We downsampled Rad21 merged per timepoint/Asyn to 31000000, CTCF merged per timepoint/Asyn to 27000000, input across timepoints/Asyn to 31000000. For reps within 0min, We downsampled CTCF 0min reps to 9000000, Rad21 0min reps to 19000000, and 0min input background to 33000000.  Line 54 in downsample_samfile*.py modified to reflect downsample number for given type.  


```
    sh downsample_after_remove_unmap_and_duplicates_wrapper_CTCF_Rad21_merge.sh  
    sh downsample_after_remove_unmap_and_duplicates_wrapper_CTCF_Rad21_0min.sh  

```

# Step5:  Peak calling.  
Run macs2 peak calling on merged and 0min replicates separately.  For merged, we decided to run punctate calling for both CTCF and Rad21.  -p 1e-8 was used for CTCF and -p 1e-4 for Rad21.  For 0min reps, we decided to run punctate calling for CTCF and diffuse broad for Rad21.  p 1e-6 used for both CTCF 0min reps and Rad21 0min reps.  

```
    sh macs_peakcall_code_CTCF_Rad21_reps_merge.sh  
    sh macs_peakcall_code_CTCF_Rad21_reps_0min.sh  
 
    output *.narrowPeak and *.broadPeak for reps_merge and reps at 0min stored here along with *.bw.  
    (treat_pileup.bdg and lambda.pileup not shown)  

```

# Step6:  Strict intersection of Rad21 0min rep3 and rep4. Strict intersection of CTCF 0min rep 0,1, and 2.  

3 Step7:  Merge all peaks together in a non-redundant peak list.  Peaks are merged as long as they share 1 bp   
