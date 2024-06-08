# To compare the overall similarity of vertical (ganglia-chain-level) groups vs horizontal groups (DRG-SG at the adjcent levels), Standard deviation between vertical groups (DRG L, SG L, DRG R, SG R) in the thoracic levels are calculated for each non-het mosaic variant, compared with standard deviation of the adjecent groups (T1,T2,T3 DRG SG L R for example).

# 8553
raw<-read.csv(file="8553_3roll_stdev_long.csv",header=T)

wilcox.test(raw[raw$Type=="Horizontal",]$value,raw[raw$Type=="Vertical",]$value,alternative="two.sided")
# Wilcoxon rank sum test with continuity correction
#
# data:  raw[raw$Type == "Horizontal", ]$value and raw[raw$Type == "Vertical", ]$value
# W = 7468168, p-value = 0.01528
# alternative hypothesis: true location shift is not equal to 0

pdf(file="8553_horizontal_vertical.pdf")	
ggplot(raw,(aes(x=factor(Type),y=value)))+
	geom_violin()+
	geom_boxplot(width=0.2)+		
	geom_jitter(alpha=0.1,aes(col=ID))+
	ylim(0,0.4)+
	labs(title="W = 7468168, p-value = 0.01528")+
	theme_bw()
dev.off()

# 8718
raw<-read.csv(file="8718_3roll_stdev_long.csv",header=T)
wilcox.test(raw[raw$Type=="Horizontal",]$value,raw[raw$Type=="Vertical",]$value,alternative="two.sided")

# Wilcoxon rank sum test with continuity correction
#
# data:  raw[raw$Type == "Horizontal", ]$value and raw[raw$Type == "Vertical", ]$value
# W = 811801, p-value < 2.2e-16
# alternative hypothesis: true location shift is not equal to 0

pdf(file="8718_horizontal_vertical.pdf")	
ggplot(raw,(aes(x=factor(Type),y=value)))+
	geom_violin()+
	geom_boxplot(width=0.2)+	
	geom_jitter(alpha=0.1,aes(col=ID))+
	ylim(0,0.4)+
	labs(title="W = 811801, p-value < 2.2e-16")+
	theme_bw()
dev.off()	

# 8990
raw<-read.csv(file="8990_3roll_stdev_long.csv",header=T)
wilcox.test(raw[raw$Type=="Horizontal",]$value,raw[raw$Type=="Vertical",]$value,alternative="two.sided")

# Wilcoxon rank sum test with continuity correction
#
# data:  raw[raw$Type == "Horizontal", ]$value and raw[raw$Type == "Vertical", ]$value
# W = 4779844, p-value = 0.007535
# alternative hypothesis: true location shift is not equal to 0

pdf(file="8990_horizontal_vertical.pdf")	
ggplot(raw,(aes(x=factor(Type),y=value)))+
	geom_violin()+
	geom_boxplot(width=0.2)+
	geom_jitter(alpha=0.1,aes(col=ID))+
	ylim(0,0.04)+
	labs(title="W = 4779844, p-value = 0.007535")+
	theme_bw()
dev.off()	
