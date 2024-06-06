# Plotting for the number of starting populations of group-shared variants

library(ggplot2)

raw<-read.csv(file="Hypergeometric_estimation.csv",header=T)
names(raw)
[1] "ID"               "Type"             "Type2"           
[4] "Level"            "Estimated_number" "CHR_POS_REF_ALT" 
[7] "Variant_LR"       "Variant_DRGSG"   


pdf(file="Estimated_number_of_common_ancestors_shared_variants.pdf",width=12,height=12)
ggplot(raw,aes(x=factor(Type,level=c("DRG_SG_C","L_R_C","DRG_SG_T","L_R_T")),y=log10(Estimated_number)))+
	geom_violin()+
	geom_jitter(alpha=0.5,aes(col=Variant_DRGSG))+
	facet_wrap(Level~ID,nrow=2,strip.position = "bottom",scales = "free_x")+
	ylim(0,4)+
	theme_classic()

ggplot(raw,aes(x=factor(Type,level=c("DRG_SG_C","L_R_C","DRG_SG_T","L_R_T")),y=log10(Estimated_number)))+
	geom_boxplot(notch=TRUE)+
	geom_jitter(alpha=0.5,aes(col=Variant_DRGSG))+
	facet_wrap(Level~ID,nrow=2,strip.position = "bottom",scales = "free_x")+
	ylim(0,4)+
	theme_classic()
dev.off()


pdf(file="Estimated_number_of_common_ancestors_shared_variants_BW.pdf",width=12,height=12)
ggplot(raw,aes(x=factor(Type,level=c("DRG_SG_C","L_R_C","DRG_SG_T","L_R_T")),y=log10(Estimated_number)))+
	geom_violin(aes(fill=raw$Type2))+
	geom_jitter(alpha=0.5)+
	facet_wrap(Level~ID,nrow=2,strip.position = "bottom",scales = "free_x")+
	ylim(0,4)+
	theme_classic()

ggplot(raw,aes(x=factor(Type,level=c("DRG_SG_C","L_R_C","DRG_SG_T","L_R_T")),y=log10(Estimated_number)))+
	geom_boxplot(aes(fill=raw$Type2),notch=TRUE)+
	geom_jitter(alpha=0.5)+
	facet_wrap(Level~ID,nrow=2,strip.position = "bottom",scales = "free_x")+
	ylim(0,4)+
	theme_classic()
dev.off()


## select variants that are shared by both Left and Right ( 0.6666667<correct left/Right<1.5)

raw2<-raw[raw$Variant_LR=="Both_LR",]

pdf(file="Estimated_number_of_common_ancestors_only_LR_both_variants.pdf",width=12,height=12)
ggplot(raw2,aes(x=factor(Type,level=c("DRG_SG_C","L_R_C","DRG_SG_T","L_R_T")),y=log10(Estimated_number)))+
	geom_violin()+
	geom_jitter(alpha=0.8,aes(col=raw2$Variant_DRGSG))+
	ylim(0,4)+
	facet_wrap(Level~ID,nrow=2,strip.position = "bottom",scales = "free_x")+
	theme_classic()
	
ggplot(raw2,aes(x=factor(Type,level=c("DRG_SG_C","L_R_C","DRG_SG_T","L_R_T")),y=log10(Estimated_number)))+
	geom_boxplot(notch=T)+
	geom_jitter(alpha=0.8,aes(col=raw2$Variant_DRGSG))+
	ylim(0,4)+
	facet_wrap(Level~ID,nrow=2,strip.position = "bottom",scales = "free_x")+
	theme_classic()
dev.off()

pdf(file="Estimated_number_of_common_ancestors_only_LR_both_variants_BW.pdf",width=12,height=12)
ggplot(raw2,aes(x=factor(Type,level=c("DRG_SG_C","L_R_C","DRG_SG_T","L_R_T")),y=log10(Estimated_number)))+
	geom_violin(aes(fill=raw2$Type2),)+
	geom_jitter(alpha=0.8)+
	ylim(0,4)+
	facet_wrap(Level~ID,nrow=2,strip.position = "bottom",scales = "free_x")+
	theme_classic()
	
ggplot(raw2,aes(x=factor(Type,level=c("DRG_SG_C","L_R_C","DRG_SG_T","L_R_T")),y=log10(Estimated_number)))+
	geom_boxplot(aes(fill=raw2$Type2),notch=T)+
	geom_jitter(alpha=0.8)+
	ylim(0,4)+
	facet_wrap(Level~ID,nrow=2,strip.position = "bottom",scales = "free_x")+
	theme_classic()
dev.off()	


# Plotting for number of starting population of group-specific variants

raw<-read.csv(file="Group_specific_estimation.csv",header=T)
raw2<-raw[raw$Clusters_of_mutations==0,]
names(raw)

pdf(file="raw_group_specific_variants.pdf",width=12, height=12)
ggplot(raw, aes(x=Type,y=log10(Estimated_number)))+
	geom_violin(aes(fill=raw$Type))+
	geom_jitter()+
	ylim(0,5)+
	facet_wrap(Level~ID, nrow=2,strip.position = "bottom")+
	theme_classic()

ggplot(raw, aes(x=Type,y=log10(Estimated_number)))+
	geom_boxplot(aes(fill=raw$Type), notch=TRUE)+
	geom_jitter()+
	ylim(0,5)+
	facet_wrap(Level~ID, nrow=2,strip.position = "bottom")+
	theme_classic()
dev.off()

## Remove variants that are clustered

raw2<-raw[raw$Clusters_of_mutations==0,]

pdf(file="raw_group_specific_variants_without_cluster_mutations.pdf",width=12, height=12)
ggplot(raw2, aes(x=Type,y=log10(Estimated_number)))+
	geom_violin(aes(fill=raw2$Type))+
	geom_jitter()+
	ylim(0,5)+
	facet_wrap(Level~ID, nrow=2,strip.position = "bottom")+
	theme_classic()

ggplot(raw2, aes(x=Type,y=log10(Estimated_number)))+
	geom_boxplot(aes(fill=raw2$Type), notch=TRUE)+
	geom_jitter()+
	ylim(0,5)+
	facet_wrap(Level~ID, nrow=2,strip.position = "bottom")+
	theme_classic()
dev.off()
