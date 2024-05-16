library(ggplot2)

## 8553
raw<-read.table(file="8553_combined.txt",header=TRUE)
names(raw)
dim(table(raw$ID))
pdf(file="8553_depth_distribution.pdf",height=6,width=20)
ggplot(raw,aes(x=ID, y=log10(REF_COUNT+ALT_COUNT)))+
  geom_violin()+
  geom_hline(yintercept=log10(500),linetype=2,col="blue")+
  theme_classic()+
  theme(axis.text.x=element_text(face="bold",size=8,angle=90))
dev.off()


## 8718
raw<-read.table(file="8718_combined.txt",header=TRUE)
names(raw)
dim(table(raw$ID))
pdf(file="8718_depth_distribution.pdf",height=6,width=20)
ggplot(raw,aes(x=ID, y=log10(REF_COUNT+ALT_COUNT)))+
  geom_violin()+
  geom_hline(yintercept=log10(500),linetype=2,col="blue")+
  theme_classic()+
  theme(axis.text.x=element_text(face="bold",size=8,angle=90))
dev.off()

## 8990
raw<-read.table(file="8990_combined.txt",header=TRUE)
names(raw)
dim(table(raw$ID))
pdf(file="8990_depth_distribution.pdf",height=6,width=20)
ggplot(raw,aes(x=ID, y=log10(REF_COUNT+ALT_COUNT)))+
  geom_violin()+
  geom_hline(yintercept=log10(500),linetype=2,col="blue")+
  theme_classic()+
  theme(axis.text.x=element_text(face="bold",size=8,angle=90))
dev.off()
