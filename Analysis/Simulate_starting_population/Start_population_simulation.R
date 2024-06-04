### Estimating the starting population based on variants shared by different groups of cells

## Both DRG and SG or Both Left and Right: 0.666667 < correct DRG/SG or corrected Left/Right < 1.5

## DRG/SG enriched or Left/Right enriched: 0.666667 > correct DRG/SG or corrected Left/Right or correct DRG/SG or corrected Left/Right > 1.5 and not 0

## For variants that are in both DRG and SG (both DRG and SG; DRG enriched; SG enriched variants), start from the average DRG_AVG_C	SG_AVG_C	MEAN_DRG_SG_C	DRG_AVG_T	SG_AVG_T	MEAN_DRG_SG_T	
 
## For variants that are in both left and right (both Left and Right, Left enriched, Right enriched), start from average LEFT_AVG_C	RIGHT_AVG_C	MEAN_DRG_SG_C_C	LEFT_AVG_T	RIGHT_AVG_T	MEAN_DRG_SG_C_T

## hypergeometric distribution simulation

## ID06 (8553)
input<-read.csv(file="8553_both_DRG_SG.csv",header=T)
rm(raw_input)
raw_input<-NA

library(FSA)
library(ggplot2)
pdf(file="8553_both_DRG_SG_C.pdf")

input$flag<-NA
input$temp<-NA
for(i in 1:nrow(input))
{
raw_input$idd<-NA
raw_input$idd<-seq(5,5000,by=5)
raw_input$hyperLB <- NA
raw_input$hyperUB <- NA
input$flag[i]=1
for(j in 1:1000){
	temp<-hyperCI(2*ceiling(raw_input$idd[j]*input$MEAN_DRG_SG_C[i]*2),raw_input$idd[j],ceiling(raw_input$idd[j]*input$MEAN_DRG_SG_C[i]*2))
#	raw_input$hyperLB[j] <- temp[ceiling(nrow(temp)/2),1]/raw_input$idd[j]
	raw_input$hyperLB[j] <- max(0,2*ceiling(raw_input$idd[j]*input$MEAN_DRG_SG_C[i]*2)/temp[2])
	raw_input$hyperUB[j] <- 2*ceiling(raw_input$idd[j]*input$MEAN_DRG_SG_C[i]*2)/temp[1]
	if(!(raw_input$hyperLB[j]>min(input$DRG_AVG_C[i]*2,input$SG_AVG_C[i]*2)&raw_input$hyperUB[j]<max(input$DRG_AVG_C[i]*2,input$SG_AVG_C[i]*2))&input$flag[i]==1){
	input$temp[i]=raw_input$idd[j]*2
	input$flag[i]=input$flag[i]*1
	}
	else{
	input$flag[i]=input$flag[i]*0
	}
}
plot <-
ggplot(as.data.frame(raw_input),aes(x=idd,y=input$MEAN_DRG_SG_C[i]*2,ymin=hyperLB,ymax=hyperUB))+
	geom_pointrange()+
	geom_hline(yintercept=input$DRG_AVG_C[i]*2,linetype=2,col="red")+
	geom_hline(yintercept=input$SG_AVG_C[i]*2,linetype=2,col="blue")+
	labs(x="Starting population",y="Cellular fractions",title=paste(input$ID[i]," ",input$temp[i]))+
	theme_classic()
	
print(plot)
}
dev.off()

write.csv(input,file="8553_both_DRG_SG_C.csv")

input<-read.csv(file="8553_both_DRG_SG.csv",header=T)
rm(raw_input)
raw_input<-NA

library(FSA)
library(ggplot2)
pdf(file="8553_both_DRG_SG_T.pdf")

input$flag<-NA
input$temp<-NA
for(i in 1:nrow(input))
{
raw_input$idd<-NA
raw_input$idd<-seq(5,5000,by=5)
raw_input$hyperLB <- NA
raw_input$hyperUB <- NA
input$flag[i]=1
for(j in 1:1000){
	temp<-hyperCI(2*ceiling(raw_input$idd[j]*input$MEAN_DRG_SG_T[i]*2),raw_input$idd[j],ceiling(raw_input$idd[j]*input$MEAN_DRG_SG_T[i]*2))
#	raw_input$hyperLB[j] <- temp[ceiling(nrow(temp)/2),1]/raw_input$idd[j]
	raw_input$hyperLB[j] <- max(0,2*ceiling(raw_input$idd[j]*input$MEAN_DRG_SG_T[i]*2)/temp[2])
	raw_input$hyperUB[j] <- 2*ceiling(raw_input$idd[j]*input$MEAN_DRG_SG_T[i]*2)/temp[1]
	if(!(raw_input$hyperLB[j]>min(input$DRG_AVG_T[i]*2,input$SG_AVG_T[i]*2)&raw_input$hyperUB[j]<max(input$DRG_AVG_T[i]*2,input$SG_AVG_T[i]*2))&input$flag[i]==1){
	input$temp[i]=raw_input$idd[j]*2
	input$flag[i]=input$flag[i]*1
	}
	else{
	input$flag[i]=input$flag[i]*0
	}
}
plot <-
ggplot(as.data.frame(raw_input),aes(x=idd,y=input$MEAN_DRG_SG_T[i]*2,ymin=hyperLB,ymax=hyperUB))+
	geom_pointrange()+
	geom_hline(yintercept=input$DRG_AVG_T[i]*2,linetype=2,col="red")+
	geom_hline(yintercept=input$SG_AVG_T[i]*2,linetype=2,col="blue")+
	labs(x="Starting population",y="Cellular fractions",title=paste(input$ID[i]," ",input$temp[i]))+
	theme_classic()
	
print(plot)
}
dev.off()

write.csv(input,file="8553_both_DRG_SG_T.csv")

input<-read.csv(file="8553_both_L_R.csv",header=T)
rm(raw_input)
raw_input<-NA

library(FSA)
library(ggplot2)
pdf(file="8553_both_L_R_C.pdf")

input$flag<-NA
input$temp<-NA
for(i in 1:nrow(input))
{
raw_input$idd<-NA
raw_input$idd<-seq(5,5000,by=5)
raw_input$hyperLB <- NA
raw_input$hyperUB <- NA
input$flag[i]=1
for(j in 1:1000){
	temp<-hyperCI(2*ceiling(raw_input$idd[j]*input$MEAN_LEFT_RIGHT_C[i]*2),raw_input$idd[j],ceiling(raw_input$idd[j]*input$MEAN_LEFT_RIGHT_C[i]*2))
#	raw_input$hyperLB[j] <- temp[ceiling(nrow(temp)/2),1]/raw_input$idd[j]
	raw_input$hyperLB[j] <- max(0,2*ceiling(raw_input$idd[j]*input$MEAN_LEFT_RIGHT_C[i]*2)/temp[2])
	raw_input$hyperUB[j] <- 2*ceiling(raw_input$idd[j]*input$MEAN_LEFT_RIGHT_C[i]*2)/temp[1]
	if(!(raw_input$hyperLB[j]>min(input$LEFT_AVG_C[i]*2,input$RIGHT_AVG_C[i]*2)&raw_input$hyperUB[j]<max(input$LEFT_AVG_C[i]*2,input$RIGHT_AVG_C[i]*2))&input$flag[i]==1){
	input$temp[i]=raw_input$idd[j]*2
	input$flag[i]=input$flag[i]*1
	}
	else{
	input$flag[i]=input$flag[i]*0
	}
}
plot <-
ggplot(as.data.frame(raw_input),aes(x=idd,y=input$MEAN_LEFT_RIGHT_C[i]*2,ymin=hyperLB,ymax=hyperUB))+
	geom_pointrange()+
	geom_hline(yintercept=input$LEFT_AVG_C[i]*2,linetype=2,col="red")+
	geom_hline(yintercept=input$RIGHT_AVG_C[i]*2,linetype=2,col="blue")+
	labs(x="Starting population",y="Cellular fractions",title=paste(input$ID[i]," ",input$temp[i]))+
	theme_classic()
	
print(plot)
}
dev.off()

write.csv(input,file="8553_both_L_R_C.csv")

input<-read.csv(file="8553_both_L_R.csv",header=T)
rm(raw_input)
raw_input<-NA

library(FSA)
library(ggplot2)
pdf(file="8553_both_L_R_T.pdf")

input$flag<-NA
input$temp<-NA
for(i in 1:nrow(input))
{
raw_input$idd<-NA
raw_input$idd<-seq(5,5000,by=5)
raw_input$hyperLB <- NA
raw_input$hyperUB <- NA
input$flag[i]=1
for(j in 1:1000){
	temp<-hyperCI(2*ceiling(raw_input$idd[j]*input$MEAN_LEFT_RIGHT_T[i]*2),raw_input$idd[j],ceiling(raw_input$idd[j]*input$MEAN_LEFT_RIGHT_T[i]*2))
#	raw_input$hyperLB[j] <- temp[ceiling(nrow(temp)/2),1]/raw_input$idd[j]
	raw_input$hyperLB[j] <- max(0,2*ceiling(raw_input$idd[j]*input$MEAN_LEFT_RIGHT_T[i]*2)/temp[2])
	raw_input$hyperUB[j] <- 2*ceiling(raw_input$idd[j]*input$MEAN_LEFT_RIGHT_T[i]*2)/temp[1]
	if(!(raw_input$hyperLB[j]>min(input$LEFT_AVG_T[i]*2,input$RIGHT_AVG_T[i]*2)&raw_input$hyperUB[j]<max(input$LEFT_AVG_T[i]*2,input$RIGHT_AVG_T[i]*2))&input$flag[i]==1){
	input$temp[i]=raw_input$idd[j]*2
	input$flag[i]=input$flag[i]*1
	}
	else{
	input$flag[i]=input$flag[i]*0
	}
}
plot <-
ggplot(as.data.frame(raw_input),aes(x=idd,y=input$MEAN_LEFT_RIGHT_T[i]*2,ymin=hyperLB,ymax=hyperUB))+
	geom_pointrange()+
	geom_hline(yintercept=input$LEFT_AVG_T[i]*2,linetype=2,col="red")+
	geom_hline(yintercept=input$RIGHT_AVG_T[i]*2,linetype=2,col="blue")+
	labs(x="Starting population",y="Cellular fractions",title=paste(input$ID[i]," ",input$temp[i]))+
	theme_classic()
	
print(plot)
}
dev.off()

write.csv(input,file="8553_both_L_R_T.csv")

## ID07 (8718)
input<-read.csv(file="8718_both_DRG_SG.csv",header=T)
rm(raw_input)
raw_input<-NA

library(FSA)
library(ggplot2)
pdf(file="8718_both_DRG_SG_C.pdf")

input$flag<-NA
input$temp<-NA
for(i in 1:nrow(input))
{
raw_input$idd<-NA
raw_input$idd<-seq(5,5000,by=5)
raw_input$hyperLB <- NA
raw_input$hyperUB <- NA
input$flag[i]=1
for(j in 1:1000){
	temp<-hyperCI(2*ceiling(raw_input$idd[j]*input$MEAN_DRG_SG_C[i]*2),raw_input$idd[j],ceiling(raw_input$idd[j]*input$MEAN_DRG_SG_C[i]*2))
#	raw_input$hyperLB[j] <- temp[ceiling(nrow(temp)/2),1]/raw_input$idd[j]
	raw_input$hyperLB[j] <- max(0,2*ceiling(raw_input$idd[j]*input$MEAN_DRG_SG_C[i]*2)/temp[2])
	raw_input$hyperUB[j] <- 2*ceiling(raw_input$idd[j]*input$MEAN_DRG_SG_C[i]*2)/temp[1]
	if(!(raw_input$hyperLB[j]>min(input$DRG_AVG_C[i]*2,input$SG_AVG_C[i]*2)&raw_input$hyperUB[j]<max(input$DRG_AVG_C[i]*2,input$SG_AVG_C[i]*2))&input$flag[i]==1){
	input$temp[i]=raw_input$idd[j]*2
	input$flag[i]=input$flag[i]*1
	}
	else{
	input$flag[i]=input$flag[i]*0
	}
}
plot <-
ggplot(as.data.frame(raw_input),aes(x=idd,y=input$MEAN_DRG_SG_C[i]*2,ymin=hyperLB,ymax=hyperUB))+
	geom_pointrange()+
	geom_hline(yintercept=input$DRG_AVG_C[i]*2,linetype=2,col="red")+
	geom_hline(yintercept=input$SG_AVG_C[i]*2,linetype=2,col="blue")+
	labs(x="Starting population",y="Cellular fractions",title=paste(input$ID[i]," ",input$temp[i]))+
	theme_classic()
	
print(plot)
}
dev.off()

write.csv(input,file="8718_both_DRG_SG_C.csv")

input<-read.csv(file="8718_both_DRG_SG.csv",header=T)
rm(raw_input)
raw_input<-NA

library(FSA)
library(ggplot2)
pdf(file="8718_both_DRG_SG_T.pdf")

input$flag<-NA
input$temp<-NA
for(i in 1:nrow(input))
{
raw_input$idd<-NA
raw_input$idd<-seq(5,5000,by=5)
raw_input$hyperLB <- NA
raw_input$hyperUB <- NA
input$flag[i]=1
for(j in 1:1000){
	temp<-hyperCI(2*ceiling(raw_input$idd[j]*input$MEAN_DRG_SG_T[i]*2),raw_input$idd[j],ceiling(raw_input$idd[j]*input$MEAN_DRG_SG_T[i]*2))
#	raw_input$hyperLB[j] <- temp[ceiling(nrow(temp)/2),1]/raw_input$idd[j]
	raw_input$hyperLB[j] <- max(0,2*ceiling(raw_input$idd[j]*input$MEAN_DRG_SG_T[i]*2)/temp[2])
	raw_input$hyperUB[j] <- 2*ceiling(raw_input$idd[j]*input$MEAN_DRG_SG_T[i]*2)/temp[1]
	if(!(raw_input$hyperLB[j]>min(input$DRG_AVG_T[i]*2,input$SG_AVG_T[i]*2)&raw_input$hyperUB[j]<max(input$DRG_AVG_T[i]*2,input$SG_AVG_T[i]*2))&input$flag[i]==1){
	input$temp[i]=raw_input$idd[j]*2
	input$flag[i]=input$flag[i]*1
	}
	else{
	input$flag[i]=input$flag[i]*0
	}
}
plot <-
ggplot(as.data.frame(raw_input),aes(x=idd,y=input$MEAN_DRG_SG_T[i]*2,ymin=hyperLB,ymax=hyperUB))+
	geom_pointrange()+
	geom_hline(yintercept=input$DRG_AVG_T[i]*2,linetype=2,col="red")+
	geom_hline(yintercept=input$SG_AVG_T[i]*2,linetype=2,col="blue")+
	labs(x="Starting population",y="Cellular fractions",title=paste(input$ID[i]," ",input$temp[i]))+
	theme_classic()
	
print(plot)
}
dev.off()

write.csv(input,file="8718_both_DRG_SG_T.csv")

input<-read.csv(file="8718_both_L_R.csv",header=T)
rm(raw_input)
raw_input<-NA

library(FSA)
library(ggplot2)
pdf(file="8718_both_L_R_C.pdf")

input$flag<-NA
input$temp<-NA
for(i in 1:nrow(input))
{
raw_input$idd<-NA
raw_input$idd<-seq(5,5000,by=5)
raw_input$hyperLB <- NA
raw_input$hyperUB <- NA
input$flag[i]=1
for(j in 1:1000){
	temp<-hyperCI(2*ceiling(raw_input$idd[j]*input$MEAN_LEFT_RIGHT_C[i]*2),raw_input$idd[j],ceiling(raw_input$idd[j]*input$MEAN_LEFT_RIGHT_C[i]*2))
#	raw_input$hyperLB[j] <- temp[ceiling(nrow(temp)/2),1]/raw_input$idd[j]
	raw_input$hyperLB[j] <- max(0,2*ceiling(raw_input$idd[j]*input$MEAN_LEFT_RIGHT_C[i]*2)/temp[2])
	raw_input$hyperUB[j] <- 2*ceiling(raw_input$idd[j]*input$MEAN_LEFT_RIGHT_C[i]*2)/temp[1]
	if(!(raw_input$hyperLB[j]>min(input$LEFT_AVG_C[i]*2,input$RIGHT_AVG_C[i]*2)&raw_input$hyperUB[j]<max(input$LEFT_AVG_C[i]*2,input$RIGHT_AVG_C[i]*2))&input$flag[i]==1){
	input$temp[i]=raw_input$idd[j]*2
	input$flag[i]=input$flag[i]*1
	}
	else{
	input$flag[i]=input$flag[i]*0
	}
}
plot <-
ggplot(as.data.frame(raw_input),aes(x=idd,y=input$MEAN_LEFT_RIGHT_C[i]*2,ymin=hyperLB,ymax=hyperUB))+
	geom_pointrange()+
	geom_hline(yintercept=input$LEFT_AVG_C[i]*2,linetype=2,col="red")+
	geom_hline(yintercept=input$RIGHT_AVG_C[i]*2,linetype=2,col="blue")+
	labs(x="Starting population",y="Cellular fractions",title=paste(input$ID[i]," ",input$temp[i]))+
	theme_classic()
	
print(plot)
}
dev.off()

write.csv(input,file="8718_both_L_R_C.csv")

input<-read.csv(file="8718_both_L_R.csv",header=T)
rm(raw_input)
raw_input<-NA

library(FSA)
library(ggplot2)
pdf(file="8718_both_L_R_T.pdf")

input$flag<-NA
input$temp<-NA
for(i in 1:nrow(input))
{
raw_input$idd<-NA
raw_input$idd<-seq(5,5000,by=5)
raw_input$hyperLB <- NA
raw_input$hyperUB <- NA
input$flag[i]=1
for(j in 1:1000){
	temp<-hyperCI(2*ceiling(raw_input$idd[j]*input$MEAN_LEFT_RIGHT_T[i]*2),raw_input$idd[j],ceiling(raw_input$idd[j]*input$MEAN_LEFT_RIGHT_T[i]*2))
#	raw_input$hyperLB[j] <- temp[ceiling(nrow(temp)/2),1]/raw_input$idd[j]
	raw_input$hyperLB[j] <- max(0,2*ceiling(raw_input$idd[j]*input$MEAN_LEFT_RIGHT_T[i]*2)/temp[2])
	raw_input$hyperUB[j] <- 2*ceiling(raw_input$idd[j]*input$MEAN_LEFT_RIGHT_T[i]*2)/temp[1]
	if(!(raw_input$hyperLB[j]>min(input$LEFT_AVG_T[i]*2,input$RIGHT_AVG_T[i]*2)&raw_input$hyperUB[j]<max(input$LEFT_AVG_T[i]*2,input$RIGHT_AVG_T[i]*2))&input$flag[i]==1){
	input$temp[i]=raw_input$idd[j]*2
	input$flag[i]=input$flag[i]*1
	}
	else{
	input$flag[i]=input$flag[i]*0
	}
}
plot <-
ggplot(as.data.frame(raw_input),aes(x=idd,y=input$MEAN_LEFT_RIGHT_T[i]*2,ymin=hyperLB,ymax=hyperUB))+
	geom_pointrange()+
	geom_hline(yintercept=input$LEFT_AVG_T[i]*2,linetype=2,col="red")+
	geom_hline(yintercept=input$RIGHT_AVG_T[i]*2,linetype=2,col="blue")+
	labs(x="Starting population",y="Cellular fractions",title=paste(input$ID[i]," ",input$temp[i]))+
	theme_classic()
	
print(plot)
}
dev.off()

write.csv(input,file="8718_both_L_R_T.csv")

## ID09 (8990)
input<-read.csv(file="8990_both_DRG_SG.csv",header=T)
rm(raw_input)
raw_input<-NA

library(FSA)
library(ggplot2)
pdf(file="8990_both_DRG_SG_C.pdf")

input$flag<-NA
input$temp<-NA
for(i in 1:nrow(input))
{
raw_input$idd<-NA
raw_input$idd<-seq(5,5000,by=5)
raw_input$hyperLB <- NA
raw_input$hyperUB <- NA
input$flag[i]=1
for(j in 1:1000){
	temp<-hyperCI(2*ceiling(raw_input$idd[j]*input$MEAN_DRG_SG_C[i]*2),raw_input$idd[j],ceiling(raw_input$idd[j]*input$MEAN_DRG_SG_C[i]*2))
#	raw_input$hyperLB[j] <- temp[ceiling(nrow(temp)/2),1]/raw_input$idd[j]
	raw_input$hyperLB[j] <- max(0,2*ceiling(raw_input$idd[j]*input$MEAN_DRG_SG_C[i]*2)/temp[2])
	raw_input$hyperUB[j] <- 2*ceiling(raw_input$idd[j]*input$MEAN_DRG_SG_C[i]*2)/temp[1]
	if(!(raw_input$hyperLB[j]>min(input$DRG_AVG_C[i]*2,input$SG_AVG_C[i]*2)&raw_input$hyperUB[j]<max(input$DRG_AVG_C[i]*2,input$SG_AVG_C[i]*2))&input$flag[i]==1){
	input$temp[i]=raw_input$idd[j]*2
	input$flag[i]=input$flag[i]*1
	}
	else{
	input$flag[i]=input$flag[i]*0
	}
}
plot <-
ggplot(as.data.frame(raw_input),aes(x=idd,y=input$MEAN_DRG_SG_C[i]*2,ymin=hyperLB,ymax=hyperUB))+
	geom_pointrange()+
	geom_hline(yintercept=input$DRG_AVG_C[i]*2,linetype=2,col="red")+
	geom_hline(yintercept=input$SG_AVG_C[i]*2,linetype=2,col="blue")+
	labs(x="Starting population",y="Cellular fractions",title=paste(input$ID[i]," ",input$temp[i]))+
	theme_classic()
	
print(plot)
}
dev.off()

write.csv(input,file="8990_both_DRG_SG_C.csv")

input<-read.csv(file="8990_both_DRG_SG.csv",header=T)
rm(raw_input)
raw_input<-NA

library(FSA)
library(ggplot2)
pdf(file="8990_both_DRG_SG_T.pdf")

input$flag<-NA
input$temp<-NA
for(i in 1:nrow(input))
{
raw_input$idd<-NA
raw_input$idd<-seq(5,5000,by=5)
raw_input$hyperLB <- NA
raw_input$hyperUB <- NA
input$flag[i]=1
for(j in 1:1000){
	temp<-hyperCI(2*ceiling(raw_input$idd[j]*input$MEAN_DRG_SG_T[i]*2),raw_input$idd[j],ceiling(raw_input$idd[j]*input$MEAN_DRG_SG_T[i]*2))
#	raw_input$hyperLB[j] <- temp[ceiling(nrow(temp)/2),1]/raw_input$idd[j]
	raw_input$hyperLB[j] <- max(0,2*ceiling(raw_input$idd[j]*input$MEAN_DRG_SG_T[i]*2)/temp[2])
	raw_input$hyperUB[j] <- 2*ceiling(raw_input$idd[j]*input$MEAN_DRG_SG_T[i]*2)/temp[1]
	if(!(raw_input$hyperLB[j]>min(input$DRG_AVG_T[i]*2,input$SG_AVG_T[i]*2)&raw_input$hyperUB[j]<max(input$DRG_AVG_T[i]*2,input$SG_AVG_T[i]*2))&input$flag[i]==1){
	input$temp[i]=raw_input$idd[j]*2
	input$flag[i]=input$flag[i]*1
	}
	else{
	input$flag[i]=input$flag[i]*0
	}
}
plot <-
ggplot(as.data.frame(raw_input),aes(x=idd,y=input$MEAN_DRG_SG_T[i]*2,ymin=hyperLB,ymax=hyperUB))+
	geom_pointrange()+
	geom_hline(yintercept=input$DRG_AVG_T[i]*2,linetype=2,col="red")+
	geom_hline(yintercept=input$SG_AVG_T[i]*2,linetype=2,col="blue")+
	labs(x="Starting population",y="Cellular fractions",title=paste(input$ID[i]," ",input$temp[i]))+
	theme_classic()
	
print(plot)
}
dev.off()

write.csv(input,file="8990_both_DRG_SG_T.csv")


input<-read.csv(file="8990_both_L_R.csv",header=T)
rm(raw_input)
raw_input<-NA

library(FSA)
library(ggplot2)
pdf(file="8990_both_L_R_C.pdf")

input$flag<-NA
input$temp<-NA
for(i in 1:nrow(input))
{
raw_input$idd<-NA
raw_input$idd<-seq(5,5000,by=5)
raw_input$hyperLB <- NA
raw_input$hyperUB <- NA
input$flag[i]=1
for(j in 1:1000){
	temp<-hyperCI(2*ceiling(raw_input$idd[j]*input$MEAN_LEFT_RIGHT_C[i]*2),raw_input$idd[j],ceiling(raw_input$idd[j]*input$MEAN_LEFT_RIGHT_C[i]*2))
#	raw_input$hyperLB[j] <- temp[ceiling(nrow(temp)/2),1]/raw_input$idd[j]
	raw_input$hyperLB[j] <- max(0,2*ceiling(raw_input$idd[j]*input$MEAN_LEFT_RIGHT_C[i]*2)/temp[2])
	raw_input$hyperUB[j] <- 2*ceiling(raw_input$idd[j]*input$MEAN_LEFT_RIGHT_C[i]*2)/temp[1]
	if(!(raw_input$hyperLB[j]>min(input$LEFT_AVG_C[i]*2,input$RIGHT_AVG_C[i]*2)&raw_input$hyperUB[j]<max(input$LEFT_AVG_C[i]*2,input$RIGHT_AVG_C[i]*2))&input$flag[i]==1){
	input$temp[i]=raw_input$idd[j]*2
	input$flag[i]=input$flag[i]*1
	}
	else{
	input$flag[i]=input$flag[i]*0
	}
}
plot <-
ggplot(as.data.frame(raw_input),aes(x=idd,y=input$MEAN_LEFT_RIGHT_C[i]*2,ymin=hyperLB,ymax=hyperUB))+
	geom_pointrange()+
	geom_hline(yintercept=input$LEFT_AVG_C[i]*2,linetype=2,col="red")+
	geom_hline(yintercept=input$RIGHT_AVG_C[i]*2,linetype=2,col="blue")+
	labs(x="Starting population",y="Cellular fractions",title=paste(input$ID[i]," ",input$temp[i]))+
	theme_classic()
	
print(plot)
}
dev.off()

write.csv(input,file="8990_both_L_R_C.csv")

input<-read.csv(file="8990_both_L_R.csv",header=T)
rm(raw_input)
raw_input<-NA

library(FSA)
library(ggplot2)
pdf(file="8990_both_L_R_T.pdf")

input$flag<-NA
input$temp<-NA
for(i in 1:nrow(input))
{
raw_input$idd<-NA
raw_input$idd<-seq(5,5000,by=5)
raw_input$hyperLB <- NA
raw_input$hyperUB <- NA
input$flag[i]=1
for(j in 1:1000){
	temp<-hyperCI(2*ceiling(raw_input$idd[j]*input$MEAN_LEFT_RIGHT_T[i]*2),raw_input$idd[j],ceiling(raw_input$idd[j]*input$MEAN_LEFT_RIGHT_T[i]*2))
#	raw_input$hyperLB[j] <- temp[ceiling(nrow(temp)/2),1]/raw_input$idd[j]
	raw_input$hyperLB[j] <- max(0,2*ceiling(raw_input$idd[j]*input$MEAN_LEFT_RIGHT_T[i]*2)/temp[2])
	raw_input$hyperUB[j] <- 2*ceiling(raw_input$idd[j]*input$MEAN_LEFT_RIGHT_T[i]*2)/temp[1]
	if(!(raw_input$hyperLB[j]>min(input$LEFT_AVG_T[i]*2,input$RIGHT_AVG_T[i]*2)&raw_input$hyperUB[j]<max(input$LEFT_AVG_T[i]*2,input$RIGHT_AVG_T[i]*2))&input$flag[i]==1){
	input$temp[i]=raw_input$idd[j]*2
	input$flag[i]=input$flag[i]*1
	}
	else{
	input$flag[i]=input$flag[i]*0
	}
}
plot <-
ggplot(as.data.frame(raw_input),aes(x=idd,y=input$MEAN_LEFT_RIGHT_T[i]*2,ymin=hyperLB,ymax=hyperUB))+
	geom_pointrange()+
	geom_hline(yintercept=input$LEFT_AVG_T[i]*2,linetype=2,col="red")+
	geom_hline(yintercept=input$RIGHT_AVG_T[i]*2,linetype=2,col="blue")+
	labs(x="Starting population",y="Cellular fractions",title=paste(input$ID[i]," ",input$temp[i]))+
	theme_classic()
	
print(plot)
}
dev.off()

write.csv(input,file="8990_both_L_R_T.csv")

## summary of all the simulations
library(ggplot2)
raw<-read.csv(file="Hypergeometric_estimation.csv",header=T)
names(raw)
[1] "ID"               "Type"             "Estimated_number"
[4] "CHR_POS_REF_ALT"  "Variant_LR"       "Variant_DRGSG" 

pdf(file="Estimated_number_of_common_ancestors_shared_variants.pdf",width=12,height=6)
ggplot(raw,aes(x=factor(Type,level=c("DRG_SG_C","L_R_C","DRG_SG_T","L_R_T")),y=log10(Estimated_number)))+
#	geom_boxplot(notch=TRUE)+
	geom_violin()+
	geom_jitter(alpha=0.5,aes(col=Variant_DRGSG))+
	facet_wrap(~ID,strip.position = "bottom")+
	theme_classic()

ggplot(raw,aes(x=factor(Type,level=c("DRG_SG_C","L_R_C","DRG_SG_T","L_R_T")),y=log10(Estimated_number)))+
	geom_boxplot(notch=TRUE)+
#	geom_violin()+
	geom_jitter(alpha=0.5,aes(col=Variant_DRGSG))+
	facet_wrap(~ID,strip.position = "bottom")+
	theme_classic()
dev.off()


pdf(file="Estimated_number_of_common_ancestors_shared_variants_BW.pdf",width=12,height=6)
ggplot(raw,aes(x=factor(Type,level=c("DRG_SG_C","L_R_C","DRG_SG_T","L_R_T")),y=log10(Estimated_number)))+
#	geom_boxplot(notch=TRUE)+
	geom_violin()+
	geom_jitter(alpha=0.5)+
	facet_wrap(~ID,strip.position = "bottom")+
	theme_classic()

ggplot(raw,aes(x=factor(Type,level=c("DRG_SG_C","L_R_C","DRG_SG_T","L_R_T")),y=log10(Estimated_number)))+
	geom_boxplot(notch=TRUE)+
#	geom_violin()+
	geom_jitter(alpha=0.5)+
	facet_wrap(~ID,strip.position = "bottom")+
	theme_classic()
dev.off()

#for variants are shared by both Left and Right ( 0.6666667<correct left/Right<1.5)

raw2<-raw[raw$Variant_LR=="Both_LR",]


pdf(file="Estimated_number_of_common_ancestors_only_LR_both_variants.pdf",width=12,height=6)
ggplot(raw2,aes(x=factor(Type,level=c("DRG_SG_C","L_R_C","DRG_SG_T","L_R_T")),y=log10(Estimated_number)))+
#	geom_boxplot(notch=T)+
	geom_violin()+
	geom_jitter(alpha=0.8,aes(col=raw2$Variant_DRGSG))+
	facet_wrap(~ID,strip.position = "bottom")+
	theme_classic()
	
ggplot(raw2,aes(x=factor(Type,level=c("DRG_SG_C","L_R_C","DRG_SG_T","L_R_T")),y=log10(Estimated_number)))+
	geom_boxplot(notch=T)+
#	geom_violin()+
	geom_jitter(alpha=0.8,aes(col=raw2$Variant_DRGSG))+
	facet_wrap(~ID,strip.position = "bottom")+
	theme_classic()
dev.off()

pdf(file="Estimated_number_of_common_ancestors_only_LR_both_variants_BW.pdf",width=12,height=6)
ggplot(raw2,aes(x=factor(Type,level=c("DRG_SG_C","L_R_C","DRG_SG_T","L_R_T")),y=log10(Estimated_number)))+
#	geom_boxplot(notch=T)+
	geom_violin()+
	geom_jitter(alpha=0.8)+
	facet_wrap(~ID,strip.position = "bottom")+
	theme_classic()
	
ggplot(raw2,aes(x=factor(Type,level=c("DRG_SG_C","L_R_C","DRG_SG_T","L_R_T")),y=log10(Estimated_number)))+
	geom_boxplot(notch=T)+
#	geom_violin()+
	geom_jitter(alpha=0.8)+
	facet_wrap(~ID,strip.position = "bottom")+
	theme_classic()
dev.off()	

##statistics for all variants that are shared by both Left and Right ( 0.6666667<correct left/Right<1.5)

# ID06 C 
wilcox.test(raw2[raw2$ID=="8553"&raw2$Type=="DRG_SG_C",]$Estimated_number,raw2[raw2$ID=="8553"&raw2$Type=="L_R_C",]$Estimated_number,alternative="two.sided")

# Wilcoxon rank sum test with continuity correction

# data:  raw2[raw2$ID == "8553" & raw2$Type == "DRG_SG_C", ]$Estimated_number and raw2[raw2$ID == "8553" & raw2$Type == "L_R_C", ]$Estimated_number
# W = 260.5, p-value = 0.03589
# alternative hypothesis: true location shift is not equal to 0

# Warning message:
# In wilcox.test.default(raw2[raw2$ID == "8553" & raw2$Type == "DRG_SG_C",  :
#  cannot compute exact p-value with ties



# ID06 T
wilcox.test(raw2[raw2$ID=="8553"&raw2$Type=="DRG_SG_T",]$Estimated_number,raw2[raw2$ID=="8553"&raw2$Type=="L_R_T",]$Estimated_number,alternative="two.sided")

# Wilcoxon rank sum test with continuity correction

# data:  raw2[raw2$ID == "8553" & raw2$Type == "DRG_SG_T", ]$Estimated_number and raw2[raw2$ID == "8553" & raw2$Type == "L_R_T", ]$Estimated_number
# W = 436, p-value = 0.4072
# alternative hypothesis: true location shift is not equal to 0

# Warning message:
# In wilcox.test.default(raw2[raw2$ID == "8553" & raw2$Type == "DRG_SG_T",  :
#  cannot compute exact p-value with ties


# ID07 C 
wilcox.test(raw2[raw2$ID=="8718"&raw2$Type=="DRG_SG_C",]$Estimated_number,raw2[raw2$ID=="8718"&raw2$Type=="L_R_C",]$Estimated_number,alternative="two.sided")

# Wilcoxon rank sum test with continuity correction

# data:  raw2[raw2$ID == "8718" & raw2$Type == "DRG_SG_C", ]$Estimated_number and raw2[raw2$ID == "8718" & raw2$Type == "L_R_C", ]$Estimated_number
# W = 485, p-value = 4.019e-12
# alternative hypothesis: true location shift is not equal to 0


# ID07 T
wilcox.test(raw2[raw2$ID=="8718"&raw2$Type=="DRG_SG_T",]$Estimated_number,raw2[raw2$ID=="8718"&raw2$Type=="L_R_T",]$Estimated_number,alternative="two.sided")

# Wilcoxon rank sum test with continuity correction

# data:  raw2[raw2$ID == "8718" & raw2$Type == "DRG_SG_T", ]$Estimated_number and raw2[raw2$ID == "8718" & raw2$Type == "L_R_T", ]$Estimated_number
# W = 645.5, p-value = 1.448e-09
# alternative hypothesis: true location shift is not equal to 0


# ID08 C
wilcox.test(raw2[raw2$ID=="8990"&raw2$Type=="DRG_SG_C",]$Estimated_number,raw2[raw2$ID=="8990"&raw2$Type=="L_R_C",]$Estimated_number,alternative="two.sided")

# Wilcoxon rank sum test with continuity correction

# data:  raw2[raw2$ID == "8990" & raw2$Type == "DRG_SG_C", ]$Estimated_number and raw2[raw2$ID == "8990" & raw2$Type == "L_R_C", ]$Estimated_number
# W = 16510, p-value < 2.2e-16
# alternative hypothesis: true location shift is not equal to 0



# ID08 T
wilcox.test(raw2[raw2$ID=="8990"&raw2$Type=="DRG_SG_T",]$Estimated_number,raw2[raw2$ID=="8990"&raw2$Type=="L_R_T",]$Estimated_number,alternative="two.sided")

# Wilcoxon rank sum test with continuity correction

# data:  raw2[raw2$ID == "8990" & raw2$Type == "DRG_SG_T", ]$Estimated_number and raw2[raw2$ID == "8990" & raw2$Type == "L_R_T", ]$Estimated_number
# W = 9367, p-value < 2.2e-16
# alternative hypothesis: true location shift is not equal to 0
