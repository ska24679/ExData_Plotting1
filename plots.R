household=read.csv("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
#I don't know if this is, strictly speaking, neccesary
household$Time=strptime(household$Time,format="%H:%M:%S")
household$Date=as.Date(household$Date)
