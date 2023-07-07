# 기존 데이터 객체 삭제
rm(list=ls())

install.packages("dplyr")
install.packages("ggplot2")
library(dplyr)
library(ggplot2)

data.raw <- read.csv(file.choose(),header = T,fileEncoding = "euc-kr")

View(data.raw)

head(data.raw)
dim(data.raw)
str(data.raw)

names(data.raw)
names(data.raw) <- c("일자", "평균기온","최대기온","최소기온","평균지표온도",
                     "최대지표온도","최소지표온도","습도","일사량","풍속")

names(data.raw)

# 일교차 변수 만들기 (최대기온 - 최소기온)
(data.raw$최대기온 - data.raw$최소기온)
data.raw$일교차 <- (data.raw$최대기온 - data.raw$최소기온)
head(data.raw)

data.raw_tempdist <- mutate(data.raw, 일교차 = 최대기온 - 최소기온)
head(data.raw_tempdist)

# 월(month) 변수 생성
data.month <- mutate(data.raw_tempdist, 월 = substr(data.raw_tempdist$일자, 6,7))
head(data.month)

# 일교차의 평균, 표준편차, 최대값, 최소값 구하기
mean(data.raw_tempdist$일교차)
sd(data.raw_tempdist$일교차)
max(data.raw_tempdist$일교차)
min(data.raw_tempdist$일교차)

# 그룹화
data.group <- group_by(data.month,월)
data.group

data.group_avg <- summarise(data.group, avg = mean(일교차))
data.group_avg

data.avg.td <- mutate(data.group, 월평균 = mean(일교차))
data.avg.td

# 불쾌지수 변수 만들기 
#(temperature humidity index = <1.8 x 온도 -0.55(1-습도)(1.8 x 온도 -26)+32 >)
# 습도가 퍼센트이므로 소수로 바꿔주기 => (습도/100)

data.thi <- mutate(data.month, 불쾌지수 = 1.8*평균기온-0.55*(1-습도/100)*(1.8*평균기온-26)+32)
head(data.thi)

data.thi$불쾌지수 >70
data.thi_70 <- data.thi[ data.thi$불쾌지수 >70, ]
head(data.thi_70)
dim(data.thi_70)[1]

filter(data.thi, 불쾌지수 >70)

# 월 평균 일교차 그래프 그리기
ggplot(data = data.group_avg, aes(x=as.numeric(월),y=avg))+
  geom_line()+
  geom_point()

ggplot(data = data.group_avg, aes(x=as.numeric(월),y=avg))+
  geom_line()+ # 선그리기
  geom_point(size = 2, color = "red")+ # 점 크기와 색깔 결정
  ggtitle("월 평균 일교차") + # 그래프 제목 추가
  ylab("기온") +
  xlab("월") +
  theme(plot.title = element_text(hjust = 0.5)) # 그래프 제목위치

# 문자형을 날짜형으로 변경
head(data.thi$일자)
str(data.thi$일자)
head(as.Date(data.thi$일자))
str(as.Date(data.thi$일자))

# 월 평균 불쾌지수 꺾은선 그래프
ggplot(data = data.thi, aes(x=as.Date(일자),y=불쾌지수))+
  geom_line()+
  ggtitle("일별 불쾌지수") +
  xlab("날짜") +
  geom_hline(yintercept = 70, linetype = "dashed", size=1, color="red")

