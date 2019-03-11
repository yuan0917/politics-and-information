setwd("~/Political and information")
library(dplyr)
library(tm)
data_201801=data.table::fread('201801_data.csv',data.table = F,encoding = 'UTF-8')
data_201802=data.table::fread('201802_data.csv',data.table = F,encoding = 'UTF-8')
data_201803=data.table::fread('201803_data.csv',data.table = F,encoding = 'UTF-8')
data_201804=data.table::fread('201804_data.csv',data.table = F,encoding = 'UTF-8')
data_201805=data.table::fread('201805_data.csv',data.table = F,encoding = 'UTF-8')
data_201806=data.table::fread('201806_data.csv',data.table = F,encoding = 'UTF-8')
data_201807=data.table::fread('201807_data.csv',data.table = F,encoding = 'UTF-8')
data_201808=data.table::fread('201808_data.csv',data.table = F,encoding = 'UTF-8')
data_201809=data.table::fread('201809_data.csv',data.table = F,encoding = 'UTF-8')
data_201810=data.table::fread('201810_data.csv',data.table = F,encoding = 'UTF-8')
data_201811=data.table::fread('201811_data.csv',data.table = F,encoding = 'UTF-8')
data_201812=data.table::fread('201812_data.csv',data.table = F,encoding = 'UTF-8')
data_201901=data.table::fread('201901_data.csv',data.table = F,encoding = 'UTF-8')

data789=rbind(data_201807,data_201808,data_201809) # 789月數據
data10111201=rbind(data_201810,data_201811,data_201812,data_201901) #10~01月數據


#7~9月粉絲頁發文中台北市長候選人出現在文章的次數
kp7=filter(data789,grepl("柯文哲",data789$Message)==T) #15457
dd7=filter(data789,grepl("丁守中",data789$Message)==T) #4204
yy7=filter(data789,grepl("姚文智",data789$Message)==T) #5187
ww7=filter(data789,grepl("吳蕚洋",data789$Message)==T) #7

#10~1粉絲頁月發文中台北市長候選人出現在文章的次數
kp10=filter(data10111201,grepl("柯文哲",data10111201$Message)==T) #24298
dd10=filter(data10111201,grepl("丁守中",data10111201$Message)==T) #7682
yy10=filter(data10111201,grepl("姚文智",data10111201$Message)==T) #5362
ww10=filter(data10111201,grepl("吳蕚洋",data10111201$Message)==T) #743

#7~9月粉絲頁發文中出現柯文哲文章的總留言數
kp7$Date=as.POSIXct(kp7$Date,format="%Y/%m/%d %H:%M:%S")
plot(kp7$Date,kp7$Comment_Count,type = "l")
#10~1月粉絲頁發文中出現柯文哲文章的總留言數
kp10$Date=as.POSIXct(kp10$Date,format="%Y/%m/%d %H:%M:%S")
plot(kp10$Date,kp10$Comment_Count,type = "l")

#7~9月粉絲頁發文中出現丁守中文章的總留言數
dd7$Date=as.POSIXct(dd7$Date,format="%Y/%m/%d %H:%M:%S")
plot(dd7$Date,dd7$Comment_Count,type = "l")
#10~1月粉絲頁發文中出現丁守中文章的總留言數
dd10$Date=as.POSIXct(dd10$Date,format="%Y/%m/%d %H:%M:%S")
plot(kp10$Date,kp10$Comment_Count,type = "l")

#7~9月粉絲頁發文中出現姚文智文章的總留言數
yy7$Date=as.POSIXct(yy7$Date,format="%Y/%m/%d %H:%M:%S")
plot(yy7$Date,yy7$Comment_Count,type = "l")
#10~1月粉絲頁發文中出現姚文智文章的總留言數
yy10$Date=as.POSIXct(yy10$Date,format="%Y/%m/%d %H:%M:%S")
plot(kp10$Date,kp10$Comment_Count,type = "l")

#7~9月粉絲頁發文中出現吳鄂洋文章的總留言數
ww7$Date=as.POSIXct(ww7$Date,format="%Y/%m/%d %H:%M:%S")
plot(ww7$Date,ww7$Comment_Count,type = "l")

#10~1月粉絲頁發文中出現吳鄂洋文章的總留言數
ww10$Date=as.POSIXct(ww10$Date,format="%Y/%m/%d %H:%M:%S")
plot(ww10$Date,ww10$Comment_Count,type = "l")



       