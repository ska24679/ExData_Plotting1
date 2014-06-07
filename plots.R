library(sqldf)
household=read.csv.sql("household_power_consumption.txt",sep=";",header=TRUE,filter="grep -E '^2/2/2007|^1/2/2007'")
#I don't know if this is, strictly speaking, neccesary
household$Date=as.Date(household$Date)
household$Time=strptime(household$Time,format="%H:%M:%S")

