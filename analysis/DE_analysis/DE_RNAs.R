library("DESeq2")
library("ggplot2")



counts <- read.csv("/data/p304229/GDA/All_counts_DEGs_TP/all_identified_predicted_RNAs.csv", sep = "\t", row.names=1)
samples <- colnames(counts)
treatment <- rep(c("Uninfected", "Infected", "Cured"), each=3)
annotation_samples <- data.frame(Sample = samples,Treatment=treatment)
(ddsMat <- DESeqDataSetFromMatrix(countData = counts,
		colData = annotation_samples,
		design = ~Treatment ))
ddsMat = ddsMat[ rowMeans(counts(ddsMat)) > 50, ]
rld <- rlog(ddsMat)
data <- plotPCA(rld, intgroup = c('Treatment'), returnData = TRUE)
dds = DESeq2::DESeq(ddsMat, parallel=TRUE)
res_inf_cur=results(dds, contrast = c('Treatment', 'Infected', 'Cured'), cooksCutoff = T)
pdf("MA_inf_cur.pdf")
plotMA(res_inf_cur, main="Infected vs Cured")
dev.off()
res_un_cur <- results(dds, contrast = c('Treatment', 'Uninfected', 'Cured'), cooksCutoff = T)
pdf("MA_un_cur.pdf")
plotMA(res_un_cur, main="Infected vs Cured")
dev.off()

write.table(res_inf_cur,"/data/p304229/GDA/All_counts_DEGs_TP/DERNAs_inf_vs_cured.csv", sep="\t")
write.table(res_un_cur,"/data/p304229/GDA/All_counts_DEGs_TP/DERNAs_unf_vs_cured.csv", sep="\t")

# Seperate Analysis infected vs cured
counts <- read.csv("/data/p304229/GDA/All_counts_DEGs_TP/all_identified_predicted_RNAs.csv", sep = "\t", row.names=1)
counts <- counts[,4:9]
samples <- colnames(counts)
treatment <- rep(c("Infected", "Cured"), each=3)
annotation_samples <- data.frame(Sample = samples,Treatment=treatment)
(ddsMat <- DESeqDataSetFromMatrix(countData = counts,
                colData = annotation_samples,
                design = ~Treatment ))
ddsMat = ddsMat[ rowMeans(counts(ddsMat)) > 50, ]
rld <- rlog(ddsMat)
data <- plotPCA(rld, intgroup = c('Treatment'), returnData = TRUE)
dds = DESeq2::DESeq(ddsMat, parallel=TRUE)
res_inf_cur=results(dds, contrast = c('Treatment', 'Infected', 'Cured'), cooksCutoff = T)
pdf("MA_inf_cur.pdf")
plotMA(res_inf_cur, main="Infected vs Cured")
dev.off()

write.table(res_inf_cur,"/data/p304229/GDA/All_counts_DEGs_TP/seperate_inf_vs_cured.csv", sep="\t")
