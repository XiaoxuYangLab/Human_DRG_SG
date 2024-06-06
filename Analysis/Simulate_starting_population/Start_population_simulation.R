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
# data:  raw2[raw2$ID == "8990" & raw2$Type == "DRG_SG_T", ]$Estimated_number and raw2[raw2$ID == "8990" & raw2$Type == "L_R_T", ]$Estimated_number
# W = 9367, p-value < 2.2e-16
# alternative hypothesis: true location shift is not equal to 0
