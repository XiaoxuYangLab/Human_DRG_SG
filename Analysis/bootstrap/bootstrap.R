# Bootstrap analysis

library(pvclust)

raw<-read.csv(file="8553_DRG_SG_no_het_MAF_sqrt.csv",header=T)
rownames(raw)<-raw$ID
raw<-raw[,-1]



set.seed(123)
res.pv <- pvclust(t(raw), method.dist="manhattan", method.hclust="complete", nboot = 10000, parallel=TRUE)
     

options(repr.plot.width=18, repr.plot.height=9)
plot(res.pv, hang = -1)
pvrect(res.pv)
     
pdf(file="8553_varXsample_heatmap_bootstrap.pdf",height=9,width=18)
plot(res.pv, hang = -1)
pvrect(res.pv)
dev.off() 


raw<-read.csv(file="8718_DRG_SG_no_het_MAF_sqrt.csv",header=T)
rownames(raw)<-raw$ID
raw<-raw[,-1]



set.seed(123)
res.pv <- pvclust(t(raw), method.dist="manhattan", method.hclust="complete", nboot = 10000, parallel=TRUE)
     

options(repr.plot.width=18, repr.plot.height=9)
plot(res.pv, hang = -1)
pvrect(res.pv)
     
pdf(file="8718_varXsample_heatmap_bootstrap.pdf",height=9,width=18)
plot(res.pv, hang = -1)
pvrect(res.pv)
dev.off() 

raw<-read.csv(file="8990_DRG_SG_no_het_MAF_sqrt.csv",header=T)
rownames(raw)<-raw$ID
raw<-raw[,-1]



set.seed(123)
res.pv <- pvclust(t(raw), method.dist="manhattan", method.hclust="complete", nboot = 10000, parallel=TRUE)
     

options(repr.plot.width=18, repr.plot.height=9)
plot(res.pv, hang = -1)
pvrect(res.pv)
     
pdf(file="8990_varXsample_heatmap_bootstrap.pdf",height=9,width=18)
plot(res.pv, hang = -1)
pvrect(res.pv)
dev.off() 
