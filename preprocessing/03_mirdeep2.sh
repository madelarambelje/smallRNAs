#!/bin/bash
#SBATCH --job-name=mirdeepGDA
#SBATCH --time=10:00:00
#SBATCH --mem-per-cpu=10GB
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mail-user=m.a.de.la.rambelje@st.hanze.nl
#SBATCH --mail-type=BEGIN,FAIL,END
#SBATCH --partition=regular

miRDeep2.pl /scratch/p304229/GDA_piRNA_removed_Ready4mirdeep2/fasta/multi_piRNA_removed.fasta \
	    /data/p304229/AjapW_Genome/Ajap_Wolbachia/Ajap_Wolbachia_contig_header.fasta \
	    /scratch/p304229/GDA_piRNA_removed_Ready4mirdeep2/arf/multi_piRNA_removed.arf \
	    /data/p304229/sRNA_DBs/hexapoda_miRNAs/hexapoda_no_whitespace_header.fa none /data/p304229/sRNA_DBs/hexapoda_miRNAs/hairpin_hexapoda_no_whitespace_header.fa -d 2> report.log

