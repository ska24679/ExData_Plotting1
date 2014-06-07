library(sqldf)
#Grep fixes everything
grep="grep -E '^2/2/2007|^1/2/2007|^Date'"
date_format="%H:%M:%S %d/%m/%Y"
file="household_power_consumption.txt"
household=read.csv.sql(file,sep=";",header=TRUE,filter=grep)
household$Time=strptime(paste(household$Time,household$Date),format=date_format)
png("plot2.png")
with(household,plot(Time,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
dev.off()

