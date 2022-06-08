library(circlize)
library(ggplot2)

cov_files <- list.files(path=".", pattern="*.cov")
EG <- cov_files[c(7,1,4)]
FC <- cov_files[c(8,2,5)]
MvL <- cov_files[c(9,3,6)]
sorted_handlers <- list(EG,FC,MvL)
names = c("EG","FC","MvL")
condition = c("inf","uninf","cur")
for (i in seq_along(sorted_handlers)) {
  cov_transformed <- list()
  colors = c("#FF000080","#0000FF80","#6B8E23")
  pdf(paste0("signal_cov_",names[i],".pdf"))
  par(cex=fontsize(16),mar = c(2, 2, 2, 2))
  cytoband.file <-  read.cytoband("cytoband.txt")
  cytoband.df <- cytoband.file$df
  circos.initializeWithIdeogram(cytoband.df,major.by = 100000)
  for (f in 1:3){
    cov <- read.table(sorted_handlers[[i]][f], sep="\t", header = FALSE)
    cov$V4 <- (cov$V4) +1
    cov$V4 <- log10(cov$V4)
    cov <- cov[which(cov$V4 > 2.5),]
    print(cov)
    circos.genomicDensity(cov, col = colors[f], track.height=0.15,bg.border = NA)
}
  dev.off()
  circos.clear()
} 
