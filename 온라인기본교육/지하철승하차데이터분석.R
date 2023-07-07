# data 불러오기
getwd()
daejeon_subway <- read.csv("Desktop/데이터청년캠퍼스/온라인기본교육/대전교통공사_역별 수송실적_20230531.csv"
                           ,header = T,fileEncoding = "euc-kr")

View(daejeon_subway)

head(daejeon_subway)
names(daejeon_subway) <- c("역번호", "역명", "1월 승차", "1월 하차", "2월 승차",
                      "2월 하차", "3월 승차", "3월 하차", "4월 승차", "4월 하차", 
                      "5월 승차", "5월 하차")

names(daejeon_subway)

str(daejeon_subway)
dim(daejeon_subway)
length(daejeon_subway)

# 데이터 전처리 (값없는 변수 제거) : 이 데이터에서는 할 필요 없음

# 1월 승차인원이 많은 정류장?
install.packages("dplyr")
library(dplyr)
max_1 <- max(daejeon_subway$`1월 승차`)
max_1
filter(daejeon_subway, `1월 승차`== max_1)
jan_max_row <- arrange(daejeon_subway,desc(`1월 승차`))
jan_max_row[1,]

(arrange(daejeon_subway,desc(`1월 승차`)))[1,] # 내림차순 정렬 후 첫번째 행 출력

which.max(daejeon_subway$`1월 승차`) # 최대값이 있는 셀의 위치
daejeon_subway[which.max(daejeon_subway$`1월 승차`),] # 최대값을 가지는 행 출력

daejeon_subway$diff <- daejeon_subway$`1월 승차`-daejeon_subway$`3월 승차`
head(daejeon_subway)
daejeon_subway_new1 <- mutate(daejeon_subway, diff = `1월 승차` -`3월 승차` )
head(daejeon_subway_new1)

boxplot(daejeon_subway$`1월 승차`, daejeon_subway$`3월 승차`)
# boxplot(daejeon_subway$`1월 승차`, daejeon_subway$`3월 승차`, main = '지하철 승차인원 분포차이',
#        xlab = '1월 vs 3월', ylab = '승차인원(명)', names=('1월','3월'))

