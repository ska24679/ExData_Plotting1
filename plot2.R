library(sqldf)
#Grep fixes everything
grep="grep -E '^2/2/2007|^1/2/2007|^Date'"
file="household_power_consumption.txt"
household=read.csv.sql(file,sep=";",header=TRUE,filter=grep)
household$Time=strptime(paste(household$Time,household$Date),format="%H:%M:%S %d/%m/%Y")
with(household,plot(Time,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
dev.copy(png,"plot2.png")
dev.off()

