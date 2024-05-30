library(ggplot2)

raw<-read.table(file="8718_ResolveOME_224_Cells_manual_10000_permutation_summary.txt",header=T)
pdf(file="8718-ResolveOME_224_cell_manual_permutation.pdf",width=5,height=2)

ggplot(raw,aes(x=T2_T2_DRG_DRG))+
	geom_density()+
	geom_vline(xintercept=0,linetype=2,col="blue")+
	labs(title="p=0.6480",y="Probability densities")+
	theme_classic()
	
ggplot(raw,aes(x=T2_T2_DRG_SG))+
	geom_density()+
	geom_vline(xintercept=2,linetype=2,col="blue")+
	labs(title="p=0.6562",y="Probability densities")+
	theme_classic()

ggplot(raw,aes(x=T2_T2_SG_SG))+
	geom_density()+
	geom_vline(xintercept=4,linetype=2,col="blue")+
	labs(title="p=0.0622",y="Probability densities")+
	theme_classic()

ggplot(raw,aes(x=T2_T3_DRG_DRG))+
	geom_density()+
	geom_vline(xintercept=1,linetype=2,col="blue")+
	labs(title="p=0.1065",y="Probability densities")+
	theme_classic()
	
ggplot(raw,aes(x=T2_T3_DRG_SG))+
	geom_density()+
	geom_vline(xintercept=15,linetype=2,col="blue")+
	labs(title="p=0.7697",y="Probability densities")+
	theme_classic()

ggplot(raw,aes(x=T2_T3_SG_SG))+
	geom_density()+
	geom_vline(xintercept=9,linetype=2,col="blue")+
	labs(title="p=0.1671",y="Probability densities")+
	theme_classic()	
	
ggplot(raw,aes(x=T3_T3_DRG_DRG))+
	geom_density()+
	geom_vline(xintercept=6,linetype=2,col="blue")+
	labs(title="p=0.4629",y="Probability densities")+
	theme_classic()
	
ggplot(raw,aes(x=T3_T3_DRG_SG))+
	geom_density()+
	geom_vline(xintercept=19,linetype=2,col="blue")+
	labs(title="p=0.4032",y="Probability densities")+
	theme_classic()

ggplot(raw,aes(x=T3_T3_SG_SG))+
	geom_density()+
	geom_vline(xintercept=20,linetype=2,col="blue")+
	labs(title="*p=0.0218 (significantly higher than expected)",y="Probability densities")+
	theme_classic()
	
dev.off()	

names(raw)
