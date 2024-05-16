library(ggplot2)

#8553
raw<-read.csv(file="8553_MPAS_WGS_noEN.csv",header=T)
names(raw)
bks=c(0,0.01,0.05,0.1,0.20,0.3,0.4,0.5,0.6,1)
cor(raw$WGS_MAF, raw$MPAS_MAF,method = "pearson",use = "complete.obs")
pdf(file="8553_MPAS_vs_WGS.pdf")
ggplot(raw,aes(x=sqrt(WGS_MAF),xmin=sqrt(WGS_LOWER_CI),xmax=sqrt(WGS_UPPER_CI),y=sqrt(MPAS_MAF),ymin=sqrt(MPAS_LOWER_CI),ymax=sqrt(MPAS_UPPER_CI)))+
	geom_point(alpha=0.01)+
	geom_pointrange(alpha=0.01)+
	theme_classic()+
	scale_x_continuous(breaks=sqrt(bks),labels=bks)+
	scale_y_continuous(breaks=sqrt(bks),labels=bks)+
	geom_smooth(method = "lm", se = FALSE)+
	geom_text(x = 0.6, y = 0.2,label = "R square: 0.96")+
	xlab("Sqrt(WGS_AF)") + 
	ylab("Sqrt(MPAS_AF)")
dev.off()

#8718
raw<-read.csv(file="8718_MPAS_WGS_noEN.csv",header=T)
names(raw)
bks=c(0,0.01,0.05,0.1,0.20,0.3,0.4,0.5,0.6,1)
cor(raw$WGS_MAF, raw$MPAS_MAF,method = "pearson",use = "complete.obs")
ggplot(raw,aes(x=sqrt(WGS_MAF),xmin=sqrt(WGS_LOWER_CI),xmax=sqrt(WGS_UPPER_CI),y=sqrt(MPAS_MAF),ymin=sqrt(MPAS_LOWER_CI),ymax=sqrt(MPAS_UPPER_CI)))+
	geom_point(alpha=0.01)+
	geom_pointrange(alpha=0.01)+
	theme_classic()+
	scale_x_continuous(breaks=sqrt(bks),labels=bks)+
	scale_y_continuous(breaks=sqrt(bks),labels=bks)+
	geom_smooth(method = "lm", se = FALSE)+
	geom_text(x = 0.6, y = 0.2,label = "R square: 0.96")+
	xlab("Sqrt(WGS_AF)") + 
	ylab("Sqrt(MPAS_AF)")
dev.off()

#8990
raw<-read.csv(file="8990_MPAS_WGS_noEN.csv",header=T)
names(raw)
bks=c(0,0.01,0.05,0.1,0.20,0.3,0.4,0.5,0.6,1)
cor(raw$WGS_MAF, raw$MPAS_MAF,method = "pearson",use = "complete.obs")
pdf(file="8990_MPAS_vs_WGS.pdf")
ggplot(raw,aes(x=sqrt(WGS_MAF),xmin=sqrt(WGS_LOWER_CI),xmax=sqrt(WGS_UPPER_CI),y=sqrt(MPAS_MAF),ymin=sqrt(MPAS_LOWER_CI),ymax=sqrt(MPAS_UPPER_CI)))+
	geom_point(alpha=0.01)+
	geom_pointrange(alpha=0.01)+
	theme_classic()+
	scale_x_continuous(breaks=sqrt(bks),labels=bks)+
	scale_y_continuous(breaks=sqrt(bks),labels=bks)+
	geom_smooth(method = "lm", se = FALSE)+
	geom_text(x = 0.6, y = 0.2,label = "R square: 0.99")+
	xlab("Sqrt(WGS_AF)") + 
	ylab("Sqrt(MPAS_AF)")
dev.off()
