library(sqldf)
#Grep fixes everything
grep="grep -E '^2/2/2007|^1/2/2007|^Date'"
file="household_power_consumption.txt"
household=read.csv.sql(file,sep=";",header=TRUE,filter=grep)
#I don't know if this is, strictly speaking, neccesary
household$Date=as.Date(household$Date)
household$Time=strptime(household$Time,format="%H:%M:%S")
hist(household$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.copy(png,"plot1.png")
dev.off()

