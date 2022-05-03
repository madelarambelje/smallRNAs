library(circlize)
library(ggplot2)
# Loading piRNAs mapping to Wolbachia genome

piRNA_cov<- read.table("DEGs_301_continues_vs_Wolbachia.bam.cov")
piRNA_cov$V1 <- "wAjap"
piRNA_cov <- piRNA_cov[which(piRNA_cov$V4 > 0),]
# Interesting regions in Wolbachia genome
feature <- data.frame(chr = c("wAjap", "wAjap","wAjap"), start = c(604673, 778441,854301), end = c(606208, 804553,855644))
# Loading Signal Wolbachia from infected wasp
KG = read.table("/students/2020-2021/master/RUG_wolbachia/WolContig_piRNA_dots/WolContig/sorted_KG_FC_sRNA_S8_L001_R1_Wol.bam.cov", sep ="\t", header = FALSE)
KG$V1 <- "wAjap"
KG$V4 <- (KG$V4) +1
KG$V4 <- log10(KG$V4)
new_KG <- KG[which(KG$V4 > 2),]

# Generating Circos graph 
cytoband.file <-  read.cytoband("cytoband.txt")
cytoband.df <- cytoband.file$df
circos.initializeWithIdeogram(cytoband.df,major.by = 100000)
circos.genomicTrack(feature, ylim=c(0,0.3),track.height = 0.05, bg.border = NA,
                    panel.fun = function(region, value, ...) {
                      circos.genomicRect(region, value,border = NA,col = c("black","#0000FF80","black"))
                    })
circos.genomicDensity(new_KG, col = c("#FF000080"), track.height=0.15,bg.border = NA)
color = rep("grey",59)
color[c(23,27,28,53)] = "black"
circos.genomicTrack(piRNA_cov, stack = TRUE, bg.border = NA,
                    panel.fun = function(region, value, ...) {
                      circos.genomicPoints(region, value, pch = 16, cex = 0.5,...,col = color)
                    })
