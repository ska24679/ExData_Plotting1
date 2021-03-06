library(sqldf)
#Grep fixes everything
grep="grep -E '^2/2/2007|^1/2/2007|^Date'"
date_format="%H:%M:%S %d/%m/%Y"
file="household_power_consumption.txt"
legend_labels=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
household=read.csv.sql(file,sep=";",header=TRUE,filter=grep)
household$Time=strptime(paste(household$Time,household$Date),format=date_format)
png("plot3.png")
with(household,plot(Time,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))
with(household,lines(Time,Sub_metering_2,type="l",col="blue"))
with(household,lines(Time,Sub_metering_3,type="l",col="red"))
legend("topright",legend_labels,col=c("black","blue","red"),lty=1)
dev.off()

