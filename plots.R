
hugedata=read.csv("../household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
household=sqldf("select * from hugedata where (Date is '01/02/2007' or Date is '02/02/2007')")
#I don't know if this is, strictly speaking, neccesary
household$Date=as.Date(household$Date)
household$Time=strptime(household$Time,format="%H:%M:%S")

