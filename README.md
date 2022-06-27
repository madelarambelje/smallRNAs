Author: Andre de la Rambelje
# The role of sncRNAs in endosymbiont-induced parthenogenesis
This repository contains scripts to analyze the expression of small non-coding RNAs in *A. japonica* and *Wolbachia*. 

## Dependancies
 
* R  4.0.4 
  | Package | Version |
  | ------------- | ------------- |
  | ggplot2  | 3.3.5 |
  |DESeq2|1.28.1|
  |circlize | 0.4.14|
  
* Python 3.8.2
  | Package | Version |
  | ------------- | ------------- |
  |numpy|1.18.3|
  |pandas|1.0.3|
  |gzip|3.8|
  |random|3.8|
  |argeparse|3.8|
  
* Python 3.7.4
   | Package | Version |
   | ------------- | ------------- |
   |keras|2.2.4-tf|
   |tensorflow|1.15.2|
  
 * Linux commandline tools
    | Package | Version |
    | ------------- | ------------- |
    |miRDeep2|2|
    |ShortStack|3.8.5|
    |bowtie|6.4.0|
    |DNAclust|3|
    |SAMTools|1.10|
    |piRNN|1|
    |DeepTools||
    |cutadapt|2.10|
  ## Workflow identification and prediction sncRNAs
 Reads were trimmed to a lengths ranging from 18 up to 31 nucleotides using cutadapt. Initially, sequences were mapped using ShortStack to genomes of *A.japonica* and *Wolbachia (wAjap)*. These mapped reads were extracted using SAMtools hereafter the identification of sncRNA types followed. 
 * Known piRNAs were identified using ShortStack and [piRBase](http://bigdata.ibp.ac.cn/piRBase/) parameters can be found [here](https://github.com/madelarambelje/smallRNAs/blob/main/preprocessing/02_GDA_ShortStack_known_piRNAs.sh). Unidentified reads were extracted and used for the identification of known and novel miRNAs and novel piRNAs.
 * Known and novel miRNAs were identified using mirdeep2 parameters can be found [here](https://github.com/madelarambelje/smallRNAs/blob/main/preprocessing/03_mirdeep2.sh). Unidentified reads were extracted and used for the identification of novel piRNAs.
 * Novel piRNAs were identified using [piRNN](https://github.com/bioinfolabmu/piRNN/blob/master/piRNN.py) the model used for the classification was *D.melanogaster*.
  ## Expression analysis identfied sncRNAs
  The presence of *wAjap* was evaluated using the coverage. The coverage was obtained using the module bamCoverage provided by d deepTools. The coverage was analyzed and visualized using R and circlize. The scripts for this can be found in this [folder]().
  Expression of sncRNAs was assessed using DESeq2 in R this script can be found [here]().  
  
  ## Classification of novel miRNAs in the subphylum *hexapoda* using Convolutional Neural Networks
  In the folder [CNN](https://github.com/madelarambelje/smallRNAs/tree/main/CNN) an attempt was made to build an accurate model for miRNA classification. Training data was derived from [RNAcentral](https://rnacentral.org/) containing sncRNAs. On [this secton](https://rnacentral.org/help/public-database) of the website you can see how to perform an advanced search on RNAclust using docker. Several types of RNAs were downloaded including: tRNAs, rRNAs,lncRNAs,piRNAs,snoRNAs and miRNAs. The negative dataset contained the types tRNAs, rRNAs,lncRNAs,piRNAs and snoRNAs. If these RNAs were longer than 31 nucleotides a random fragment was taken from the RNA. The positive dataset contained only miRNAs and only sequences ranging frm 18 to 31 nucleotides were used for training. The sequences were one-hot encoded. The model consisted of 3 convolutional layers and 2 dense layers with an inputshape of 
(31,4).  
