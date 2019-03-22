library(readr)
data07 <- read_csv("201807_data.csv")
data08 <- read_csv("201808_data.csv")
data09 <- read_csv("201809_data.csv")
data10 <- read_csv("201810_data.csv")
data11 <- read_csv("201811_data.csv")
data12 <- read_csv("201812_data.csv")

alldata=rbind(data07,data08,data09,data10,data11,data12)

mean(nchar(alldata$Message))

KP=filter(alldata,grepl("柯文哲",alldata$Message)==T)
dd=filter(alldata,grepl("丁守中",alldata$Message)==T)
YW=filter(alldata,grepl("姚文智",alldata$Message)==T)          

### POSIXct轉換時間格式
KP$Date=as.POSIXct(KP$Date,format="%Y/%m/%d %H:%M:%S")       
dd$Date=as.POSIXct(dd$Date,format="%Y/%m/%d %H:%M:%S")
YW$Date=as.POSIXct(YW$Date,format="%Y/%m/%d %H:%M:%S")

KPCount<-KP%>%group_by(month=format(Date,"%m"))%>%count()%>%mutate(type="柯文哲")
ddCount<-dd%>%group_by(month=format(Date,"%m"))%>%count()%>%mutate(type="丁守中")
YWCount<-YW%>%group_by(month=format(Date,"%m"))%>%count()%>%mutate(type="姚文智")

month_rank=rbind(KPCount,ddCount,YWCount)%>%arrange((month))

###BAR
ggplot(month_rank,aes(x=month,y=n,fill=type))+
  geom_bar(stat="identity",position = "dodge")

###LINE
ggplot(month_rank,aes(x=month,y=n,group=type,color=type))+geom_line()

###BOXPLOT
ggplot(month_rank,aes(x=month,y=n))+
  geom_boxplot()

