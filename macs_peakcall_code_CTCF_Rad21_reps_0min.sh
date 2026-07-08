#Punctate Peak Calling example
bsub macs2 callpeak -t CTCF-Noc0h-Rep0_onlymapped_sorted_noduplicates_downsampled.sam -c Input-Noc0h_onlymapped_sorted_noduplicates_0minexp_downsampled.sam -f SAM -p 1e-6 -g mm  -n CTCF_rep0_0min_downsampled -B --SPMR

bsub macs2 callpeak -t CTCF-Noc0h-Rep1_onlymapped_sorted_noduplicates_downsampled.sam -c Input-Noc0h_onlymapped_sorted_noduplicates_0minexp_downsampled.sam -f SAM -p 1e-6 -g mm  -n CTCF_rep1_0min_downsampled -B --SPMR

bsub macs2 callpeak -t CTCF-Noc0h-Rep2_onlymapped_sorted_noduplicates_downsampled.sam -c Input-Noc0h_onlymapped_sorted_noduplicates_0minexp_downsampled.sam -f SAM -p 1e-6 -g mm  -n CTCF_rep2_0min_downsampled -B --SPMR

#Diffuse Peak Calling example
bsub macs2 callpeak -t Rad21-Noc0h-Rep3_onlymapped_sorted_noduplicates_downsampled.sam -c Input-Noc0h_onlymapped_sorted_noduplicates_0minexp_downsampled.sam -f SAM -p 1e-6 -g mm -n Rad21_rep3_0min_downsampled  -B --SPMR --broad --broad-cutoff 1e-4

bsub macs2 callpeak -t Rad21-Noc0h-Rep4_onlymapped_sorted_noduplicates_downsampled.sam -c Input-Noc0h_onlymapped_sorted_noduplicates_0minexp_downsampled.sam -f SAM -p 1e-6 -g mm -n Rad21_rep4_0min_downsampled  -B --SPMR --broad --broad-cutoff 1e-4

