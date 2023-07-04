# 패키지 설치하기
install.packages("hflights") #데이터셋 설치
library(hflights)
hflights
hf <- hflights # 데이터 셋 이름 변경

# 데이터 파악 함수
View(hf) # 뷰어창 확인
head(hf) # 앞에서 6행
tail(hf) # 뒤에서 6행

str(hf) # 데이터구조, 변수, 개수, 변수명, 관찰치개수, 미리보기
dim(hf) # 데이터의 차원(행,열)

names(hf) # 데이터프레임의 변수명(열이름) 확인
colnames(hf) # 열이름 확인
ls(hf) # 데이터세트의 변수명 확인

ls() # 저장되어있는 객체 모두 출력
rm(list=ls()) # 모든 객체 삭제

# 패키지 설치(데이터 전처리)
install.packages('dplyr')
library(dplyr)
hf <- hflights

filter(hf, Month ==1, DayofMonth ==1) # 1월1일 데이터 추출
filter(hf, Month == 1 | Month ==2) # 1월 혹은 2월 데이터 추출

select(hf, Year, Month, Dayofweek) # Year, Month, DayOfweek 열을 추출
select(hf, Year : Dayofweek) # year부터 dayofweek까지 열을 추출

# ArrDely 열과 DepDelay 열의 차이를 계산한 결과를 gain변수로 추가
mutate(hf, gain = ArrDelay - DepDelay)

# 데이터를 year, month, dayofmonth 순으로 오름차순 정렬
arrange(hf, Year, Month, DayofMonth)

# 데이터를 Month의 큰 값으로 부터 작은 값 순으로 내림차순 정렬
arrange(hf, desc(Month))

distinct(hf, Year) #Year에 대해 유일 값 추출
distinct(hf, Year, Month) # year,month에 대해 유일값 추출

# 도착지연평균, 도착지연 최대
summarise(hf, 지연평균=mean(ArrDelay), 지연최대=max(ArrDelay))

# 도착지연평균, 도착지연 최대(결측치 제거)
summarise(hf, 지연평균=mean(ArrDelay,na.rm=TRUE), 지연최대=max(ArrDelay,na.rm=TRUE))

#TailNum(항공기등록번호) 별로 그룹화하여 그룹별 갯수, 그룹별 지연평균 계산
summarise(group_by(hf,TailNum),갯수=n(), 지연평균=mean(ArrDelay,na.rm=TRUE))

