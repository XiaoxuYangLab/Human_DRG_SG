library(ggplot2)
library("RColorBrewer")

#8553
raw<-read.csv(file="8553_positive_variants.csv",header=T)
pdf(file="8553_DRG_SG_geoclones_update20240403.pdf",width=6,height=17)
for(i in 1:nrow(raw)){
temp<-raw[raw$CHROM.POS.REF.ALT==names(table(raw$CHROM.POS.REF.ALT))[i],]
plot <-
	ggplot()+
		geom_rect(data=temp, mapping=aes(xmin=x1, xmax=x2, ymin=y1, ymax=y2, fill=sqrt(MAF)), alpha=0.5,col="black") +
		labs(title=names(table(raw$CHROM.POS.REF.ALT))[i],x="")+
		scale_fill_gradient(low = "white", high = "red")+
		annotate("segment",x=4,xend=5,y=14.25,yend=15.75)+
		annotate("segment",x=4,xend=5,y=14.25,yend=15.25)+
		annotate("segment",x=4,xend=5,y=14.25,yend=14.75)+
		annotate("segment",x=4,xend=5,y=14.25,yend=14.25)+
		annotate("segment",x=4,xend=5,y=13.25,yend=13.75)+
		annotate("segment",x=4,xend=5,y=13.25,yend=13.25)+
		annotate("segment",x=4,xend=5,y=12.25,yend=12.75)+
		annotate("segment",x=4,xend=5,y=12.25,yend=12.25)+
		annotate("segment",x=4,xend=5,y=12.25,yend=11.25)+
		annotate("segment",x=4,xend=5,y=11.25,yend=10.75)+
		annotate("segment",x=4,xend=5,y=10.75,yend=10.25)+
		annotate("segment",x=4,xend=5,y=10.25,yend=9.75)+
		annotate("segment",x=4,xend=5,y=9.75,yend=9.25)+
		annotate("segment",x=4,xend=5,y=9.25,yend=8.75)+
		annotate("segment",x=4,xend=5,y=8.75,yend=8.25)+
		annotate("segment",x=4,xend=5,y=8.25,yend=7.75)+
		annotate("segment",x=4,xend=5,y=7.75,yend=7.25)+
		annotate("segment",x=4,xend=5,y=7.25,yend=6.75)+
		annotate("segment",x=4,xend=5,y=6.75,yend=6.25)+
		annotate("segment",x=4,xend=5,y=6.25,yend=5.75)+
		annotate("segment",x=4,xend=5,y=5.75,yend=4.75)+
		annotate("segment",x=9,xend=10,y=15.75,yend=14.25)+
		annotate("segment",x=9,xend=10,y=15.25,yend=14.25)+
		annotate("segment",x=9,xend=10,y=14.75,yend=14.25)+
		annotate("segment",x=9,xend=10,y=14.25,yend=14.25)+
		annotate("segment",x=9,xend=10,y=13.75,yend=13.25)+
		annotate("segment",x=9,xend=10,y=13.25,yend=13.25)+
		annotate("segment",x=9,xend=10,y=12.75,yend=12.25)+
		annotate("segment",x=9,xend=10,y=12.25,yend=12.25)+
		annotate("segment",x=9,xend=10,y=11.25,yend=12.25)+
		annotate("segment",x=9,xend=10,y=10.75,yend=11.25)+
		annotate("segment",x=9,xend=10,y=10.25,yend=10.75)+
		annotate("segment",x=9,xend=10,y=9.75,yend=10.25)+
		annotate("segment",x=9,xend=10,y=9.25,yend=9.75)+
		annotate("segment",x=9,xend=10,y=8.75,yend=9.25)+
		annotate("segment",x=9,xend=10,y=8.25,yend=8.75)+
		annotate("segment",x=9,xend=10,y=7.75,yend=8.25)+
		annotate("segment",x=9,xend=10,y=7.25,yend=7.75)+
		annotate("segment",x=9,xend=10,y=6.75,yend=7.25)+
		annotate("segment",x=9,xend=10,y=6.25,yend=6.75)+
		annotate("segment",x=9,xend=10,y=5.75,yend=6.25)+
		annotate("segment",x=9,xend=10,y=4.75,yend=5.75)+
		annotate("text", x = 4.5, y = -0.25, label = "Skin-L")+
		annotate("text", x = 9.5, y = -0.25, label = "Skin-R")+
		annotate("text", x = 5, y = 4.25, label = "DRG-L")+
		annotate("text", x = 9, y = 4.25, label = "DRG-R")+
		annotate("text", x = 6.25, y = 0.75, label = "SC-L")+
		annotate("text", x = 7.75, y = 0.75, label = "SC-R")+
		annotate("text", x = 3.5, y = 4.25, label = "SG-L")+
		annotate("text", x = 10.5, y = 4.25, label = "SG-R")+
		annotate("text", x = 3, y = 21.75, label = "Ctx-F-L")+
		annotate("text", x = 11, y = 21.75, label = "Ctx-F-R")+
		annotate("text", x = 3, y = 20.75, label = "Ctx-P-L")+
		annotate("text", x = 3, y = 19.75, label = "Cau-L")+
		annotate("text", x = 3, y = 18.75, label = "Put-L")+
		annotate("text", x = 3, y = 17.75, label = "Hip-L")+
		annotate("text", x = 3, y = 16.75, label = "Cb-L")+
		annotate("text", x = 2.6, y = 15.75, label = "C1")+
		annotate("text", x = 2.6, y = 11.25, label = "T1")+
		annotate("text", x = 2.6, y = 4.75, label = "L1")+
		annotate("text", x = 2.6, y = 1.75, label = "S1")+
		annotate("text", x = 1.5, y = 8.75, label = "Liver")+
		annotate("text", x = 1.5, y = 6.75, label = "Heart")+
		annotate("text", x = 1, y = 4.75, label = "Kidney-L")+
		annotate("text", x = 13, y = 4.75, label = "Kidney-R")+
		annotate("rect", xmin=13, xmax=14, ymin=11 , ymax=11.5, fill="grey",col="black")+
		annotate("text", x = 13.5, y = 10.5, label = "NA")+
		theme_bw()+
		theme(
	  axis.line = element_blank(), 
	  axis.text.x = element_blank(), 
	  axis.text.y = element_blank(),
	  axis.ticks = element_blank(), 
	  axis.title.x = element_blank(), 
	  axis.title.y = element_blank(), 
	  axis.ticks.margin = unit(c(0,0,0,0), "lines"), 
	  legend.position = "right", 
	  panel.background = element_rect(fill = "white"), 
	  panel.border = element_blank(), 
	  panel.grid.major = element_blank(), 
	  panel.grid.minor = element_blank(), 
	  panel.margin = unit(c(0,0,0,0), "lines"), 
	  plot.margin = unit(c(0,0,0,0), "lines")
	)

print(plot)
}
dev.off()

#8718
raw<-read.csv(file="8718_positive_variants.csv",header=T)
pdf(file="8718_DRG_SG_geoclones_update20240403.pdf",width=6,height=15)
for(i in 1:nrow(raw)){
temp<-raw[raw$CHROM.POS.REF.ALT==names(table(raw$CHROM.POS.REF.ALT))[i],]
plot <-
	ggplot()+
		geom_rect(data=temp, mapping=aes(xmin=x1, xmax=x2, ymin=y1, ymax=y2, fill=sqrt(MAF)), alpha=0.5,col="black") +
		labs(title=names(table(raw$CHROM.POS.REF.ALT))[i],x="")+
		scale_fill_gradient(low = "white", high = "red")+
		annotate("segment",x=4,xend=5,y=11.25,yend=12.75)+
		annotate("segment",x=4,xend=5,y=11.25,yend=12.25)+
		annotate("segment",x=4,xend=5,y=11.25,yend=11.75)+
		annotate("segment",x=4,xend=5,y=11.25,yend=11.25)+
		annotate("segment",x=4,xend=5,y=10.25,yend=10.75)+
		annotate("segment",x=4,xend=5,y=10.25,yend=10.25)+
		annotate("segment",x=4,xend=5,y=9.25,yend=9.75)+
		annotate("segment",x=4,xend=5,y=9.25,yend=9.25)+
		annotate("segment",x=4,xend=5,y=9.25,yend=8.25)+
		annotate("segment",x=4,xend=5,y=8.25,yend=7.75)+
		annotate("segment",x=4,xend=5,y=7.75,yend=7.25)+
		annotate("segment",x=4,xend=5,y=7.25,yend=6.75)+
		annotate("segment",x=4,xend=5,y=6.75,yend=6.25)+
		annotate("segment",x=4,xend=5,y=6.25,yend=5.75)+
		annotate("segment",x=4,xend=5,y=5.75,yend=5.25)+
		annotate("segment",x=4,xend=5,y=5.25,yend=4.75)+
		annotate("segment",x=4,xend=5,y=4.75,yend=4.25)+
		annotate("segment",x=4,xend=5,y=4.25,yend=3.75)+
		annotate("segment",x=4,xend=5,y=3.75,yend=3.25)+
		annotate("segment",x=4,xend=5,y=3.25,yend=2.75)+
		annotate("segment",x=4,xend=5,y=2.75,yend=1.75)+
		annotate("segment",x=4,xend=5,y=1.75,yend=1.25)+
		annotate("segment",x=7,xend=8,y=12.75,yend=11.25)+
		annotate("segment",x=7,xend=8,y=12.25,yend=11.25)+
		annotate("segment",x=7,xend=8,y=11.75,yend=11.25)+
		annotate("segment",x=7,xend=8,y=11.25,yend=11.25)+
		annotate("segment",x=7,xend=8,y=10.75,yend=10.25)+
		annotate("segment",x=7,xend=8,y=10.25,yend=10.25)+
		annotate("segment",x=7,xend=8,y=9.75,yend=9.25)+
		annotate("segment",x=7,xend=8,y=9.25,yend=9.25)+
		annotate("segment",x=7,xend=8,y=8.25,yend=9.25)+
		annotate("segment",x=7,xend=8,y=7.75,yend=8.25)+
		annotate("segment",x=7,xend=8,y=7.25,yend=7.75)+
		annotate("segment",x=7,xend=8,y=6.75,yend=7.25)+
		annotate("segment",x=7,xend=8,y=6.25,yend=6.75)+
		annotate("segment",x=7,xend=8,y=5.75,yend=6.25)+
		annotate("segment",x=7,xend=8,y=5.25,yend=5.75)+
		annotate("segment",x=7,xend=8,y=4.75,yend=5.25)+
		annotate("segment",x=7,xend=8,y=4.25,yend=4.75)+
		annotate("segment",x=7,xend=8,y=3.75,yend=4.25)+
		annotate("segment",x=7,xend=8,y=3.25,yend=3.75)+
		annotate("segment",x=7,xend=8,y=2.75,yend=3.25)+
		annotate("segment",x=7,xend=8,y=1.75,yend=2.75)+
		annotate("segment",x=7,xend=8,y=1.25,yend=1.75)+
		annotate("text", x = 4.5, y = -0.25, label = "Skin-L")+
		annotate("text", x = 7.5, y = -0.25, label = "Skin-R")+
		annotate("text", x = 5.25, y = 0.75, label = "DRG-L")+
		annotate("text", x = 6.75, y = 0.75, label = "DRG-R")+
		annotate("text", x = 3.5, y = 1.25, label = "SG-L")+
		annotate("text", x = 8.5, y = 1.25, label = "SG-R")+
		annotate("text", x = 3, y = 15.75, label = "Ctx-PF-L")+
		annotate("text", x = 9, y = 15.75, label = "Ctx-PF-R")+
		annotate("text", x = 3, y = 14.75, label = "Cau-L")+
		annotate("text", x = 9, y = 14.75, label = "Cau-R")+
		annotate("text", x = 3, y = 13.75, label = "Hip-L")+
		annotate("text", x = 9, y = 13.75, label = "Hip-R")+
		annotate("text", x = 2.5, y = 12.75, label = "C1")+
		annotate("text", x = 2.5, y = 8.25, label = "T1")+
		annotate("text", x = 2.5, y = 1.75, label = "L1")+
		annotate("text", x = 1.5, y = 4.75, label = "Heart")+
		annotate("text", x = 1.5, y = 2.75, label = "Kidney-L")+
		annotate("text", x = 10.5, y = 2.75, label = "Kidney-R")+
		annotate("rect", xmin=11, xmax=12, ymin=8 , ymax=8.5, fill="grey",col="black")+
		annotate("text", x = 11.5, y = 7.5, label = "NA")+
		theme_bw()+
		theme(
	  axis.line = element_blank(), 
	  axis.text.x = element_blank(), 
	  axis.text.y = element_blank(),
	  axis.ticks = element_blank(), 
	  axis.title.x = element_blank(), 
	  axis.title.y = element_blank(), 
	  #axis.ticks.length = unit(0, "lines"), # Error 
	  axis.ticks.margin = unit(c(0,0,0,0), "lines"), 
	  legend.position = "right", 
	  panel.background = element_rect(fill = "white"), 
	  panel.border = element_blank(), 
	  panel.grid.major = element_blank(), 
	  panel.grid.minor = element_blank(), 
	  panel.margin = unit(c(0,0,0,0), "lines"), 
	  plot.margin = unit(c(0,0,0,0), "lines")
	)
print(plot)
}
dev.off()


#8990
raw<-read.csv(file="8990_positive_variants.csv",header=T)
pdf(file="8990_DRG_SG_geoclones_update20240506.pdf",width=7,height=15)
for(i in 1:nrow(raw)){
temp<-raw[raw$CHROM.POS.REF.ALT==names(table(raw$CHROM.POS.REF.ALT))[i],]
plot <-
	ggplot()+
		geom_rect(data=temp, mapping=aes(xmin=x1, xmax=x2, ymin=y1, ymax=y2, fill=sqrt(MAF)), alpha=0.5,col="black") +
		labs(title=names(table(raw$CHROM.POS.REF.ALT))[i],x="")+
		scale_fill_gradient(low = "white", high = "red")+
		annotate("segment",x=4,xend=5,y=11.25,yend=12.75)+
		annotate("segment",x=4,xend=5,y=11.25,yend=12.25)+
		annotate("segment",x=4,xend=5,y=11.25,yend=11.75)+
		annotate("segment",x=4,xend=5,y=11.25,yend=11.25)+
		annotate("segment",x=4,xend=5,y=10.25,yend=10.75)+
		annotate("segment",x=4,xend=5,y=10.25,yend=10.25)+
		annotate("segment",x=4,xend=5,y=9.25,yend=9.75)+
		annotate("segment",x=4,xend=5,y=9.25,yend=9.25)+
		annotate("segment",x=4,xend=5,y=9.25,yend=8.25)+
		annotate("segment",x=4,xend=5,y=8.25,yend=7.75)+
		annotate("segment",x=4,xend=5,y=7.75,yend=7.25)+
		annotate("segment",x=4,xend=5,y=7.25,yend=6.75)+
		annotate("segment",x=4,xend=5,y=6.75,yend=6.25)+
		annotate("segment",x=4,xend=5,y=6.25,yend=5.75)+
		annotate("segment",x=4,xend=5,y=5.75,yend=5.25)+
		annotate("segment",x=4,xend=5,y=5.25,yend=4.75)+
		annotate("segment",x=4,xend=5,y=4.75,yend=4.25)+
		annotate("segment",x=4,xend=5,y=4.25,yend=3.75)+
		annotate("segment",x=4,xend=5,y=3.75,yend=3.25)+
		annotate("segment",x=4,xend=5,y=3.25,yend=2.75)+
		annotate("segment",x=4,xend=5,y=2.75,yend=1.75)+
		annotate("segment",x=4,xend=5,y=1.75,yend=1.25)+
		annotate("segment",x=7,xend=8,y=12.75,yend=11.25)+
		annotate("segment",x=7,xend=8,y=12.25,yend=11.25)+
		annotate("segment",x=7,xend=8,y=11.75,yend=11.25)+
		annotate("segment",x=7,xend=8,y=11.25,yend=11.25)+
		annotate("segment",x=7,xend=8,y=10.75,yend=10.25)+
		annotate("segment",x=7,xend=8,y=10.25,yend=10.25)+
		annotate("segment",x=7,xend=8,y=9.75,yend=9.25)+
		annotate("segment",x=7,xend=8,y=9.25,yend=9.25)+
		annotate("segment",x=7,xend=8,y=8.25,yend=9.25)+
		annotate("segment",x=7,xend=8,y=7.75,yend=8.25)+
		annotate("segment",x=7,xend=8,y=7.25,yend=7.75)+
		annotate("segment",x=7,xend=8,y=6.75,yend=7.25)+
		annotate("segment",x=7,xend=8,y=6.25,yend=6.75)+
		annotate("segment",x=7,xend=8,y=5.75,yend=6.25)+
		annotate("segment",x=7,xend=8,y=5.25,yend=5.75)+
		annotate("segment",x=7,xend=8,y=4.75,yend=5.25)+
		annotate("segment",x=7,xend=8,y=4.25,yend=4.75)+
		annotate("segment",x=7,xend=8,y=3.75,yend=4.25)+
		annotate("segment",x=7,xend=8,y=3.25,yend=3.75)+
		annotate("segment",x=7,xend=8,y=2.75,yend=3.25)+
		annotate("segment",x=7,xend=8,y=1.75,yend=2.75)+
		annotate("segment",x=7,xend=8,y=1.25,yend=1.75)+
		annotate("text", x = 5.25, y = 0.75, label = "DRG-L")+
		annotate("text", x = 6.75, y = 0.75, label = "DRG-R")+
		annotate("text", x = 3.5, y = 1.25, label = "SG-L")+
		annotate("text", x = 8.5, y = 1.25, label = "SG-R")+
		annotate("text", x = 3, y = 14.75, label = "Ctx-PF-L")+
		annotate("text", x = 9, y = 14.75, label = "Ctx-PF-R")+
		annotate("text", x = 3, y = 13.75, label = "Cb-L")+
		annotate("text", x = 9, y = 13.75, label = "Cb-R")+
		annotate("text", x = 2.5, y = 12.75, label = "C1")+
		annotate("text", x = 2.5, y = 8.25, label = "T1")+
		annotate("text", x = 2.5, y = 1.75, label = "L1")+
		annotate("text", x = 1.5, y = 4.75, label = "Heart-L")+
		annotate("text", x = 10.5, y = 4.75, label = "Heart-L")+
		annotate("text", x = 1.5, y = 2.75, label = "Kidney-L")+
		annotate("text", x = 10.5, y = 2.75, label = "Kidney-R")+
		annotate("text", x = 1.5, y = 0.75, label = "Liver")+
		annotate("rect", xmin=11, xmax=12, ymin=8 , ymax=8.5, fill="grey",col="black")+
		annotate("text", x = 11.5, y = 7.5, label = "NA")+
		theme_bw()+
		theme(
	  axis.line = element_blank(), 
	  axis.text.x = element_blank(), 
	  axis.text.y = element_blank(),
	  axis.ticks = element_blank(), 
	  axis.title.x = element_blank(), 
	  axis.title.y = element_blank(), 
	  axis.ticks.margin = unit(c(0,0,0,0), "lines"), 
	  legend.position = "right", 
	  panel.background = element_rect(fill = "white"), 
	  panel.border = element_blank(), 
	  panel.grid.major = element_blank(), 
	  panel.grid.minor = element_blank(), 
	  panel.margin = unit(c(0,0,0,0), "lines"), 
	  plot.margin = unit(c(0,0,0,0), "lines")
	)
print(plot)
}
dev.off()
