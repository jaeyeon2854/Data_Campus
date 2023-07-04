# Data R로 불러오기
getwd() # 현재 작업공간 확인

# read.csv("파일명",header=T : 첫번째 행이 변수명이면 T)
highway_acci <- read.csv("/Users/jaeyeon/Desktop/데이터청년캠퍼스/온라인기본교육/한국도로공사_교통사고통계_20211231.csv",header=T,fileEncoding = "euc-kr")

highway_acci

# Data 저장하기
write.csv(highway_acci,file="고속도로 사고 데이터.csv") #csv형식
write.table(highway_acci,file = "고속도로 사고 데이터.txt",sep=',') #txt형식 ,(쉼표)구분

# 엑셀파일 저장하기
install.packages("writexl") #패키지 설치
library(writexl) # 패키지 로드
write_xlsx(highway_acci,"고속도로 사고 데이터.xlsx")

# 엑셀파일 불러오기
install.packages("readxl")
library(readxl)
highway_acci_excel <- read_excel("고속도로 사고 데이터.xlsx")

