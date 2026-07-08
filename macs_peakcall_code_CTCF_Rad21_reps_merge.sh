#Punctate p1e-8 Peak Calling CTCF
bsub macs2 callpeak -t merge3_CTCF-Noc0h-Reps_onlymapped_sorted_noduplicates_sorted_downsampled.sam -c Input-Noc0h_onlymapped_sorted_noduplicates_downsampled.sam -f SAM -p 1e-8 -g mm  -n CTCF_reps_merge_0min_downsampled -B --SPMR

bsub macs2 callpeak -t merge2_CTCF-Noc25min-Reps_onlymapped_sorted_noduplicates_sorted_downsampled.sam -c Input-Noc25min_onlymapped_sorted_noduplicates_downsampled.sam -f SAM -p 1e-8 -g mm  -n CTCF_reps_merge_25min_downsampled -B --SPMR

bsub macs2 callpeak -t merge2_CTCF-Noc1h-Reps_onlymapped_sorted_noduplicates_sorted_downsampled.sam -c Input-Noc1h_onlymapped_sorted_noduplicates_downsampled.sam -f SAM -p 1e-8 -g mm  -n CTCF_reps_merge_60min_downsampled -B --SPMR

bsub macs2 callpeak -t merge2_CTCF-Noc2h-Reps_onlymapped_sorted_noduplicates_sorted_downsampled.sam -c Input-Noc2h_onlymapped_sorted_noduplicates_downsampled.sam -f SAM -p 1e-8 -g mm  -n CTCF_reps_merge_120min_downsampled -B --SPMR

bsub macs2 callpeak -t merge2_CTCF-Noc4h-Reps_onlymapped_sorted_noduplicates_sorted_downsampled.sam -c Input-Noc4h_onlymapped_sorted_noduplicates_downsampled.sam -f SAM -p 1e-8 -g mm  -n CTCF_reps_merge_240min_downsampled -B --SPMR

bsub macs2 callpeak -t merge2_CTCF-Asyn-Reps_onlymapped_sorted_noduplicates_sorted_downsampled.sam -c Input-Asyn_onlymapped_sorted_noduplicates_downsampled.sam -f SAM -p 1e-8 -g mm  -n CTCF_reps_merge_Asyn_downsampled -B --SPMR


#Punctate p1e-4  Peak Calling Rad21
bsub macs2 callpeak -t merge2_Rad21-Noc0h-Reps_onlymapped_sorted_noduplicates_sorted_downsampled.sam -c Input-Noc0h_onlymapped_sorted_noduplicates_downsampled.sam -f SAM -p 1e-4 -g mm -n Rad21_reps_merge_0min_downsampled_punctate_p1e4  -B --SPMR

bsub macs2 callpeak -t merge2_Rad21-Noc25min-Reps_onlymapped_sorted_noduplicates_sorted_downsampled.sam -c Input-Noc25min_onlymapped_sorted_noduplicates_downsampled.sam -f SAM -p 1e-4 -g mm -n Rad21_reps_merge_25min_downsampled_punctate_p1e4  -B --SPMR

bsub macs2 callpeak -t merge2_Rad21-Noc1h-Reps_onlymapped_sorted_noduplicates_sorted_downsampled.sam -c Input-Noc1h_onlymapped_sorted_noduplicates_downsampled.sam -f SAM -p 1e-4 -g mm -n Rad21_reps_merge_60min_downsampled_punctate_p1e4  -B --SPMR

bsub macs2 callpeak -t merge2_Rad21-Noc2h-Reps_onlymapped_sorted_noduplicates_sorted_downsampled.sam -c Input-Noc2h_onlymapped_sorted_noduplicates_downsampled.sam -f SAM -p 1e-4 -g mm -n Rad21_reps_merge_120min_downsampled_punctate_p1e4  -B --SPMR

bsub macs2 callpeak -t merge2_Rad21-Noc4h-Reps_onlymapped_sorted_noduplicates_sorted_downsampled.sam -c Input-Noc4h_onlymapped_sorted_noduplicates_downsampled.sam -f SAM -p 1e-4 -g mm -n Rad21_reps_merge_240min_downsampled_punctate_p1e4  -B --SPMR

bsub macs2 callpeak -t merge2_Rad21-Asyn-Reps_onlymapped_sorted_noduplicates_sorted_downsampled.sam -c Input-Asyn_onlymapped_sorted_noduplicates_downsampled.sam -f SAM -p 1e-4 -g mm -n Rad21_reps_merge_Asyn_downsampled_punctate_p1e4  -B --SPMR

