library(circlize)
library(ggplot2)
pdf("circlize.pdf")
par(mar = c(2, 2, 2, 2))
cytoband.file <-  read.cytoband("cytoband.txt")
cytoband.df <- cytoband.file$df
circos.initializeWithIdeogram(cytoband.df)
KG = read.table("/students/2020-2021/master/RUG_wolbachia/WolContig/KG_EG_sRNA_S9_L001_Wol.bam_882.cov", sep ="\t", header = FALSE)
KG$V4 <- (KG$V4) +1
KG$V4 <- log10(KG$V4)
new_KG <- KG[which(KG$V4 > 2.5),]
circos.genomicDensity(new_KG, col = c("#FF000080"), track.height=0.1)
JMS = read.table("/students/2020-2021/master/RUG_wolbachia/WolContig/JMS_EG_sRNA_S5_L001_Wol.bam_882.cov", sep ="\t", header = FALSE)
JMS$V4 = (JMS$V4) +1
JMS$V4 = log10(JMS$V4)
new_JMS <- JMS[which(JMS$V4 > 2.5),]
circos.genomicDensity(new_JMS, col = c("#0000FF80"), track.height=0.1)
KG_plus <- read.table("/students/2020-2021/master/RUG_wolbachia/WolContig/KGplus_EG1_sRNA_S10_L001_Wol.bam_882.cov", sep ="\t", header = FALSE)
KG_plus$V4 = (KG_plus$V4) +1
KG_plus$V4 = log10(KG_plus$V4)
new_KG_plus <- KG_plus[which(KG_plus$V4 > 2.5),]
circos.genomicDensity(new_KG_plus, col = c("#6B8E23"), track.height=0.1)

par(mar = c(2, 2, 2, 2))
cytoband.file <-  read.cytoband("cytoband.txt")
cytoband.df <- cytoband.file$df
circos.initializeWithIdeogram(cytoband.df)
KG = read.table("/students/2020-2021/master/RUG_wolbachia/WolContig/KG_FC_sRNA_S8_L001_Wol.bam_882.cov", sep ="\t", header = FALSE)
KG$V4 <- (KG$V4) +1
KG$V4 <- log10(KG$V4)
new_KG <- KG[which(KG$V4 > 2.5),]
circos.genomicDensity(new_KG, col = c("#FF000080"), track.height=0.1)
JMS = read.table("/students/2020-2021/master/RUG_wolbachia/WolContig/JMS_FC1_sRNA_S6_L001_Wol.bam_882.cov", sep ="\t", header = FALSE)
JMS$V4 = (JMS$V4) +1
JMS$V4 = log10(JMS$V4)
new_JMS <- JMS[which(JMS$V4 > 2.5),]
circos.genomicDensity(new_JMS, col = c("#0000FF80"), track.height=0.1)
KG_plus <- read.table("/students/2020-2021/master/RUG_wolbachia/WolContig/KGplus_FC_sRNA_S11_L001_Wol.bam_882.cov", sep ="\t", header = FALSE)
KG_plus$V4 = (KG_plus$V4) +1
KG_plus$V4 = log10(KG_plus$V4)
new_KG_plus <- KG_plus[which(KG_plus$V4 > 2.5),]
circos.genomicDensity(new_KG_plus, col = c("#6B8E23"), track.height=0.1)


par(mar = c(2, 2, 2, 2))
cytoband.file <-  read.cytoband("cytoband.txt")
cytoband.df <- cytoband.file$df
circos.initializeWithIdeogram(cytoband.df)
KG = read.table("/students/2020-2021/master/RUG_wolbachia/WolContig/KG_MvL1_sRNA_S7_L001_Wol.bam_882.cov", sep ="\t", header = FALSE)
KG$V4 <- (KG$V4) +1
KG$V4 <- log10(KG$V4)
new_KG <- KG[which(KG$V4 > 2.5),]
circos.genomicDensity(new_KG, col = c("#FF000080"), track.height=0.1)
JMS = read.table("/students/2020-2021/master/RUG_wolbachia/WolContig/JMS_MvL_sRNA_S4_L001_Wol.bam_882.cov", sep ="\t", header = FALSE)
JMS$V4 = (JMS$V4) +1
JMS$V4 = log10(JMS$V4)
new_JMS <- JMS[which(JMS$V4 > 2.5),]
circos.genomicDensity(new_JMS, col = c("#0000FF80"), track.height=0.1)
KG_plus <- read.table("/students/2020-2021/master/RUG_wolbachia/WolContig/KGplus_MvL_sRNA_S12_L001_Wol.bam_882.cov", sep ="\t", header = FALSE)
KG_plus$V4 = (KG_plus$V4) +1
KG_plus$V4 = log10(KG_plus$V4)
new_KG_plus <- KG_plus[which(KG_plus$V4 > 2.5),]
circos.genomicDensity(new_KG_plus, col = c("#6B8E23"), track.height=0.1)
dev.off()
