library(ggplot2)

## 8553
raw<-read.table(file="8553_combined.txt",header=TRUE)
names(raw)
dim(table(raw$ID))
## positive and negative cutoff analysis
raw2<-raw[raw$ID!="JGG-P1"&raw$ID!="JGG-P1-R1"&raw$ID!="JGG-P1-R2",]

pdf(file="8553-all-af.pdf")
ggplot(raw2,aes(x=MAF,fill=CATEGORY, col=CATEGORY))+
	geom_histogram(bins=200,alpha=0.5, position="dodge")+
	theme_classic()
dev.off()


raw3<-raw2[raw2$CATEGORY=="ALT_HOMO",]

## look at heterozygous controls to see whether they perform as expected (hets)

pdf(file="8553-alt-homo-AF-test-removed.pdf",width=30,height=5)
ggplot(raw3,aes(x=CHROM.POS.REF.ALT,y=MAF,ymax=UPPER_CI,ymin=LOWER_CI))+
	geom_point(alpha=0.1)+
	geom_pointrange(alpha=0.1)+
	theme_classic()+
	theme(axis.text.x=element_text(face="bold",size=8,angle=90))
dev.off()

pdf(file="8553-homo.pdf")
ggplot(raw3,aes(x=1-MAF,fill=CATEGORY, col=CATEGORY))+
	geom_histogram(bins=200,alpha=0.5, position="dodge")+
	scale_y_log10()+
	theme_classic()
dev.off()

pdf(file="8553-homo2.pdf")
ggplot(raw3,aes(x=1-MAF,fill=CATEGORY, col=CATEGORY))+
	geom_histogram(bins=200,alpha=0.5, position="dodge")+
	theme_classic()
dev.off()

quantile(1-raw3$LOWER_CI,c(0.025,0.05,0.25,0.5,0.75,0.9,0.95,0.975),na.rm=TRUE)

## 0.0278686750 should be the cutoff for upper bound for homozygous from N=16851 variants
raw4<-raw2[raw2$CATEGORY=="HETERO",]

## look at heterozygous controls to see whether they perform as expected (hets)

pdf(file="8553-het-AF-test-removed.pdf",width=30,height=5)
ggplot(raw4,aes(x=CHROM.POS.REF.ALT,y=MAF,ymax=UPPER_CI,ymin=LOWER_CI))+
	geom_point(alpha=0.1)+
	geom_pointrange(alpha=0.1)+
	theme_classic()+
	theme(axis.text.x=element_text(face="bold",size=8,angle=90))
dev.off()

pdf(file="8553-hetero.pdf")
ggplot(raw4,aes(x=MAF,fill=CATEGORY, col=CATEGORY))+
	geom_histogram(bins=200,alpha=0.5, position="dodge")+
	scale_y_log10()+
	theme_classic()
dev.off()

pdf(file="8553-hetero2.pdf")
ggplot(raw4,aes(x=MAF,fill=CATEGORY, col=CATEGORY))+
	geom_histogram(bins=200,alpha=0.5, position="dodge")+
	theme_classic()
dev.off()


quantile(raw4$MAF,c(0.025,0.05,0.25,0.5,0.75,0.95,0.975),na.rm=TRUE)
## 0.4084610 and 0.5799192 should be the cutoff for hetero for 8553 
raw5<-raw2[raw2$CATEGORY!="HETERO"&raw2$CATEGORY!="ALT_HOMO",]

bks=c(0,0.01,0.05,0.1,0.20,0.3,0.4,0.5,0.6,1)

pdf(file="8553_AMPLISEQ.pdf",width=20)
for(i in 1:3147){
temp<-raw5[raw5$CHROM.POS.REF.ALT==names(table(raw5$CHROM.POS.REF.ALT))[i],]
plot <-
ggplot(raw5[raw5$CHROM.POS.REF.ALT==names(table(raw5$CHROM.POS.REF.ALT))[i],],aes(x=ID,y=sqrt(MAF),ymin=sqrt(LOWER_CI),ymax=sqrt(UPPER_CI)))+
	geom_pointrange(alpha=0.5)+
	geom_point(alpha=0.5)+
	geom_hline(yintercept=sqrt(0.0014105),linetype=2,col="red")+
	geom_hline(yintercept=sqrt(0.6),linetype=2,col="red")+
	geom_hline(yintercept=sqrt(0.5),linetype=2,col="red")+
	geom_hline(yintercept=sqrt(0.4),linetype=2,col="red")+
	scale_y_continuous(breaks=sqrt(bks),labels=bks)+
	theme_classic()+
	labs(title=names(table(raw$CHROM.POS.REF.ALT))[i],x="")+
	theme(axis.text.x=element_text(face="bold",size=5,angle=90))
print(plot)
}
dev.off()

## define mosaic:
## lower>0.0278686750
## upper<0.4084610
## lower>JGG upper
## validated in original sample

## 8718
raw<-read.table(file="8718_combined.txt",header=TRUE)
names(raw)
dim(table(raw$ID))
## positive and negative cutoff analysis
raw2<-raw[raw$ID!="JGG-P1"&raw$ID!="JGG-P2"&raw$ID!="JGG-P2-R1",]

pdf(file="8718-all-af.pdf")
ggplot(raw2,aes(x=MAF,fill=CATEGORY, col=CATEGORY))+
	geom_histogram(bins=200,alpha=0.5, position="dodge")+
	theme_classic()
dev.off()


raw3<-raw2[raw2$CATEGORY=="ALT_HOMO",]

## look at heterozygous controls to see whether they perform as expected (hets)

pdf(file="8718-alt-homo-AF-test-removed.pdf",width=30,height=5)
ggplot(raw3,aes(x=CHROM.POS.REF.ALT,y=MAF,ymax=UPPER_CI,ymin=LOWER_CI))+
	geom_point(alpha=0.1)+
	geom_pointrange(alpha=0.1)+
	theme_classic()+
	theme(axis.text.x=element_text(face="bold",size=8,angle=90))
dev.off()

pdf(file="8718-homo.pdf")
ggplot(raw3,aes(x=1-MAF,fill=CATEGORY, col=CATEGORY))+
	geom_histogram(bins=200,alpha=0.5, position="dodge")+
	scale_y_log10()+
	theme_classic()
dev.off()

pdf(file="8718-homo2.pdf")
ggplot(raw3,aes(x=1-MAF,fill=CATEGORY, col=CATEGORY))+
	geom_histogram(bins=200,alpha=0.5, position="dodge")+
	theme_classic()
dev.off()

quantile(1-raw3$LOWER_CI,c(0.025,0.05,0.25,0.5,0.75,0.9,0.95,0.975),na.rm=TRUE)
## 0.0454769028 should be the cutoff for upperbond for homozygous from N=16851 variants
raw4<-raw2[raw2$CATEGORY=="HETERO",]

## look at heterozygous controls to see whether they perform as expected (hets)

pdf(file="8718-het-AF-test-removed.pdf",width=30,height=5)
ggplot(raw4,aes(x=CHROM.POS.REF.ALT,y=MAF,ymax=UPPER_CI,ymin=LOWER_CI))+
	geom_point(alpha=0.1)+
	geom_pointrange(alpha=0.1)+
	theme_classic()+
	theme(axis.text.x=element_text(face="bold",size=8,angle=90))
dev.off()

pdf(file="8718-hetero.pdf")
ggplot(raw4,aes(x=MAF,fill=CATEGORY, col=CATEGORY))+
	geom_histogram(bins=200,alpha=0.5, position="dodge")+
	scale_y_log10()+
	theme_classic()
dev.off()

pdf(file="8718-hetero2.pdf")
ggplot(raw4,aes(x=MAF,fill=CATEGORY, col=CATEGORY))+
	geom_histogram(bins=200,alpha=0.5, position="dodge")+
	theme_classic()
dev.off()


quantile(raw4$MAF,c(0.025,0.05,0.25,0.5,0.75,0.95,0.975),na.rm=TRUE)
## 0.4166667 and 0.5710154 should be the cutoff for hetero for 8553 
raw5<-raw2[raw2$CATEGORY!="HETERO"&raw2$CATEGORY!="ALT_HOMO",]

bks=c(0,0.01,0.05,0.1,0.20,0.3,0.4,0.5,0.6,1)

pdf(file="8718_AMPLISEQ.pdf",width=20)
for(i in 1:3147){
temp<-raw5[raw5$CHROM.POS.REF.ALT==names(table(raw5$CHROM.POS.REF.ALT))[i],]
plot <-
ggplot(raw5[raw5$CHROM.POS.REF.ALT==names(table(raw5$CHROM.POS.REF.ALT))[i],],aes(x=ID,y=sqrt(MAF),ymin=sqrt(LOWER_CI),ymax=sqrt(UPPER_CI)))+
	geom_pointrange(alpha=0.5)+
	geom_point(alpha=0.5)+
	geom_hline(yintercept=sqrt(0.0014105),linetype=2,col="red")+
	geom_hline(yintercept=sqrt(0.6),linetype=2,col="red")+
	geom_hline(yintercept=sqrt(0.5),linetype=2,col="red")+
	geom_hline(yintercept=sqrt(0.4),linetype=2,col="red")+
	scale_y_continuous(breaks=sqrt(bks),labels=bks)+
	theme_classic()+
	labs(title=names(table(raw$CHROM.POS.REF.ALT))[i],x="")+
	theme(axis.text.x=element_text(face="bold",size=5,angle=90))
print(plot)
}
dev.off()

## define mosaic:
## lower>0.0454769028
## upper<0.4166667
## lower>JGG upper
## validated in original sample

## 8990
raw<-read.table(file="8990_combined.txt",header=TRUE)
names(raw)
dim(table(raw$ID))
## positive and negative cutoff analysis
raw2<-raw[raw$ID!="JGG",]

pdf(file="8990-all-af.pdf")
ggplot(raw2,aes(x=MAF,fill=CATEGORY, col=CATEGORY))+
	geom_histogram(bins=200,alpha=0.5, position="dodge")+
	theme_classic()
dev.off()

raw3<-raw2[raw2$CATEGORY=="ALT_HOMO",]

## look at heterozygous controls to see whether they perform as expected (hets)

pdf(file="8990-alt-homo-AF-test-removed.pdf",width=30,height=5)
ggplot(raw3,aes(x=CHROM.POS.REF.ALT,y=MAF,ymax=UPPER_CI,ymin=LOWER_CI))+
	geom_point(alpha=0.1)+
	geom_pointrange(alpha=0.1)+
	theme_classic()+
	theme(axis.text.x=element_text(face="bold",size=8,angle=90))
dev.off()

pdf(file="8990-homo.pdf")
ggplot(raw3,aes(x=1-MAF,fill=CATEGORY, col=CATEGORY))+
	geom_histogram(bins=200,alpha=0.5, position="dodge")+
	scale_y_log10()+
	theme_classic()
dev.off()

pdf(file="8990-homo2.pdf")
ggplot(raw3,aes(x=1-MAF,fill=CATEGORY, col=CATEGORY))+
	geom_histogram(bins=200,alpha=0.5, position="dodge")+
	theme_classic()
dev.off()

quantile(1-raw3$LOWER_CI,c(0.025,0.05,0.25,0.5,0.75,0.9,0.95,0.975),na.rm=TRUE)
## 0.0034990564 should be the cutoff for upperbond for homozygous from N=6100 variants

raw4<-raw2[raw2$CATEGORY=="HETERO",]

## look at heterozygous controls to see whether they perform as expected (hets)

pdf(file="8990-het-AF-test-removed.pdf",width=30,height=5)
ggplot(raw4,aes(x=CHROM.POS.REF.ALT,y=MAF,ymax=UPPER_CI,ymin=LOWER_CI))+
	geom_point(alpha=0.1)+
	geom_pointrange(alpha=0.1)+
	theme_classic()+
	theme(axis.text.x=element_text(face="bold",size=8,angle=90))
dev.off()

pdf(file="8990-hetero.pdf")
ggplot(raw4,aes(x=MAF,fill=CATEGORY, col=CATEGORY))+
	geom_histogram(bins=200,alpha=0.5, position="dodge")+
	scale_y_log10()+
	theme_classic()
dev.off()

pdf(file="8990-hetero2.pdf")
ggplot(raw4,aes(x=MAF,fill=CATEGORY, col=CATEGORY))+
	geom_histogram(bins=200,alpha=0.5, position="dodge")+
	theme_classic()
dev.off()


quantile(raw4$MAF,c(0.025,0.05,0.25,0.5,0.75,0.95,0.975),na.rm=TRUE)
## 0.4644791 and 0.5381781 should be the cutoff for hetero for 8990 


raw5<-raw[raw$CATEGORY!="HETERO"&raw2$CATEGORY!="ALT_HOMO",]

bks=c(0,0.01,0.05,0.1,0.20,0.3,0.4,0.5,0.6,1)

pdf(file="8990_AMPLISEQ.pdf",width=20)
for(i in 1:2693){
temp<-raw5[raw5$CHROM.POS.REF.ALT==names(table(raw5$CHROM.POS.REF.ALT))[i],]
plot <-
ggplot(raw5[raw5$CHROM.POS.REF.ALT==names(table(raw5$CHROM.POS.REF.ALT))[i],],aes(x=ID,y=sqrt(MAF),ymin=sqrt(LOWER_CI),ymax=sqrt(UPPER_CI)))+
	geom_pointrange(alpha=0.5)+
	geom_point(alpha=0.5)+
	geom_hline(yintercept=sqrt(0.0014105),linetype=2,col="red")+
	geom_hline(yintercept=sqrt(0.6),linetype=2,col="red")+
	geom_hline(yintercept=sqrt(0.5),linetype=2,col="red")+
	geom_hline(yintercept=sqrt(0.4),linetype=2,col="red")+
	scale_y_continuous(breaks=sqrt(bks),labels=bks)+
	theme_classic()+
	labs(title=names(table(raw$CHROM.POS.REF.ALT))[i],x="")+
	theme(axis.text.x=element_text(face="bold",size=5,angle=90))
print(plot)
}
dev.off()

raw<-read.csv(file="8990_combined_positive_variants.csv",header=TRUE)
raw5<-raw[raw$CATEGORY!="HETERO"&raw$CATEGORY!="ALT_HOMO",]
raw6<-raw5[raw5$Mosaic_variant=="1"&raw5$Het_variant!="1",]

bks=c(0,0.01,0.05,0.1,0.20,0.3,0.4,0.5,0.6,1)

pdf(file="8990_AMPLISEQ_no_het.pdf",width=20)
for(i in 1:506){
temp<-raw6[raw6$CHROM.POS.REF.ALT==names(table(raw6$CHROM.POS.REF.ALT))[i],]
plot <-
ggplot(raw6[raw6$CHROM.POS.REF.ALT==names(table(raw6$CHROM.POS.REF.ALT))[i],],aes(x=ID,y=sqrt(MAF),ymin=sqrt(LOWER_CI),ymax=sqrt(UPPER_CI)))+
	geom_pointrange(alpha=0.5)+
	geom_point(alpha=0.5)+
	geom_hline(yintercept=sqrt(0.0014105),linetype=2,col="red")+
	geom_hline(yintercept=sqrt(0.6),linetype=2,col="red")+
	geom_hline(yintercept=sqrt(0.5),linetype=2,col="red")+
	geom_hline(yintercept=sqrt(0.4),linetype=2,col="red")+
	scale_y_continuous(breaks=sqrt(bks),labels=bks)+
	theme_classic()+
	labs(title=names(table(raw$CHROM.POS.REF.ALT))[i],x="")+
	theme(axis.text.x=element_text(face="bold",size=5,angle=90))
print(plot)
}
dev.off()

## define mosaic:
## lower>0.0034990564
## upper<0.4644791
## lower>JGG upper
## validated in original sample
