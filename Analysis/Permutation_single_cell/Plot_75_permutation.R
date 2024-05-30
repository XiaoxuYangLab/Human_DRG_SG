# in R
library(ggplot2)

raw<-read.delim(file="8718_ResolveOME_75_Cells_10000_permutation_summary.txt",header=T)

pdf(file="8718-ResolveOME_75_cell_permutation.pdf",width=5,height=2)

ggplot(raw,aes(x=T2_T2_DRG_DRG))+
	geom_density()+
	geom_vline(xintercept=0,linetype=2,col="blue")+
	labs(title="p=0.9019",y="Probability densities")+
	theme_classic()
	
ggplot(raw,aes(x=T2_T2_DRG_SG))+
	geom_density()+
	geom_vline(xintercept=1,linetype=2,col="blue")+
	labs(title="p=0.7962",y="Probability densities")+
	theme_classic()

ggplot(raw,aes(x=T2_T2_SG_SG))+
	geom_density()+
	geom_vline(xintercept=1,linetype=2,col="blue")+
	labs(title="p=0.5857",y="Probability densities")+
	theme_classic()

ggplot(raw,aes(x=T2_T3_DRG_DRG))+
	geom_density()+
	geom_vline(xintercept=0,linetype=2,col="blue")+
	labs(title="p=0.4540",y="Probability densities")+
	theme_classic()
	
ggplot(raw,aes(x=T2_T3_DRG_SG))+
	geom_density()+
	geom_vline(xintercept=6,linetype=2,col="blue")+
	labs(title="p=0.8814",y="Probability densities")+
	theme_classic()

ggplot(raw,aes(x=T2_T3_SG_SG))+
	geom_density()+
	geom_vline(xintercept=4,linetype=2,col="blue")+
	labs(title="p=0.1251",y="Probability densities")+
	theme_classic()	
	
ggplot(raw,aes(x=T3_T3_DRG_DRG))+
	geom_density()+
	geom_vline(xintercept=1,linetype=2,col="blue")+
	labs(title="p=0.7768",y="Probability densities")+
	theme_classic()
	
ggplot(raw,aes(x=T3_T3_DRG_SG))+
	geom_density()+
	geom_vline(xintercept=3,linetype=2,col="blue")+
	labs(title="p=0.0427 (significantly lower than expected)",y="Probability densities")+
	theme_classic()

ggplot(raw,aes(x=T3_T3_SG_SG))+
	geom_density()+
	geom_vline(xintercept=12,linetype=2,col="blue")+
	labs(title="p=0.0011 (significantly higher than expected)",y="Probability densities")+
	theme_classic()

ggplot(raw,aes(x=SameLevel_DRG_DRG))+
	geom_density()+
	geom_vline(xintercept=1,linetype=2,col="blue")+
	labs(title="p=0.3090",y="Probability densities")+
	theme_classic()

ggplot(raw,aes(x=SameLevel_DRG_SG))+
	geom_density()+
	geom_vline(xintercept=4,linetype=2,col="blue")+
	labs(title="p=0.0718",y="Probability densities")+
	theme_classic()

ggplot(raw,aes(x=SameLevel_SG_SG))+
	geom_density()+
	geom_vline(xintercept=13,linetype=2,col="blue")+
	labs(title="p=0.0106 (significantly higher than expected)",y="Probability densities")+
	theme_classic()

ggplot(raw,aes(x=DifferentLevel_Same.Ganglia))+
	geom_density()+
	geom_vline(xintercept=4,linetype=2,col="blue")+
	labs(title="p=0.0227 (significantly lower than expected)",y="Probability densities")+
	theme_classic()

ggplot(raw,aes(x=SameLevel_Same.Ganglia))+
	geom_density()+
	geom_vline(xintercept=14,linetype=2,col="blue")+
	labs(title="p=0.0718",y="Probability densities")+
	theme_classic()
	
dev.off()
