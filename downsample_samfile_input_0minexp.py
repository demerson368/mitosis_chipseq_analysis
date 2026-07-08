import sys
import numpy as np


def main():
        in_fname, out_fname = sys.argv[1:3]
        shuffled_line_numbers = resample_reads_from_sam( in_fname, out_fname )
        return None



def resample_reads_from_sam( in_fname, out_fname ):

	input = open(in_fname,'r')


        ##Determine line numbers for mapped reads in .sam file that pass Illumina Casava filter

        counting = 0
        for line in input:
		if line.startswith('@SQ') or line.startswith('@PG'):
			#print line
			continue
                elif line.startswith('@HD'):
                        #print line
                        continue
                elif line.startswith('HWI') and line.strip('\n').split(':')[7] == 'Y':
                        #print line
			continue
        	elif line.startswith('HWI') and line.strip('\n').split(':')[7] == 'N':
			#print line.strip('\n').split(':')[7]
			continue
 
		else:
			#print line
			counting += 1
        input.close()

        line_num_array=np.arange(1,counting+1)
        print counting
	print line_num_array


	##Shuffle line numbers randomly

	np.random.shuffle(line_num_array)        
        print line_num_array, "here is my shuffled line numbers"
        print np.shape(line_num_array)

        ##Select only the first 20,000,000 lines of the random suffle

        resampled_list = []
        resampled_list_2 = []
	resampled_list = line_num_array[0:33000000]
        resampled_list_2 = resampled_list
	#print resampled_list
	#print resampled_list_2
	resampled_dict = {}
	resampled_dict = dict(zip(resampled_list, resampled_list_2))

	#print resampled_dict


	##Print only lines from resampled list to file

        input = open(in_fname,'r')
        output = open(out_fname, 'w')
   
	tally = 0
	indexing_tally = 0
        for line in input:
                if line.startswith('@SQ') or line.startswith('@PG'):
                        #print line
                        print >> output, line.strip('\n')
                elif line.startswith('@HD'):
                        #print line
                        print >> output, line.strip('\n')
                elif line.startswith('HWI') and line.strip('\n').split(':')[7] == 'Y':
                        #print line
                        continue
                elif line.startswith('HWI') and line.strip('\n').split(':')[7] == 'N':
                        #print line.strip('\n').split(':')[9]
                        continue
                else:
                        tally += 1
			#print tally
			if tally in resampled_dict:
				#print line
				print >> output, line.strip('\n')
			else:
				continue
	
        input.close()
	output.close()
        return [line_num_array]


if __name__ == "__main__":
        main()

