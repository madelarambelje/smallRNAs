#!/bin/bash
#SBATCH --job-name=MappingAW
#SBATCH --time=24:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=6
#SBATCH --mem-per-cpu=5GB
#SBATCH --partition=regular
#SBATCH --mail-user=m.a.de.la.rambelje@st.hanze.nl
#SBATCH --mail-type=BEGIN,FAIL,END

cd /data/p304229/Trimmed_18_31
ShortStack --genomefile /data/p304229/AjapW_Genome/Ajap_Wolbachia/Ajap_Wolbachia.fasta \
           --mmap u \
           --bowtie_cores 6 \
	   --dicermax 28 \
           --outdir /data/p304229/ShortStack_GDA/Multi_piRNA_GDA \
           --readfile JMS_EG_sRNA_S5_L001_R1.fastq.gz JMS_FC1_sRNA_S6_L001_R1.fastq.gz JMS_MvL_sRNA_S4_L001_R1.fastq.gz KG_EG_sRNA_S9_L001_R1.fastq.gz KG_FC_sRNA_S8_L001_R1.fastq.gz KG_MvL1_sRNA_S7_L001_R1.fastq.gz KGplus_EG1_sRNA_S10_L001_R1.fastq.gz KGplus_FC_sRNA_S11_L001_R1.fastq.gz KGplus_MvL_sRNA_S12_L001_R1.fastq.gz


