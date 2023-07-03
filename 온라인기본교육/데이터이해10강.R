x <- 10
y <- c(1,2,3,4,5)
z <- c(x,y)

str(z)
length(z)

# 벡터  생성 함수

## 지정된 값만큼 증감하는 데이터 생성
seq(1,7,by=2) # from, to, by, length, along
seq(1,-1,by=0.5)
seq(1,7,length=3)
rev(seq(1:5)) #rev : 자료의 순서를 역순으로 만드는 함수

## 값이 반복되는 데이터 생성
rep(c(1,2,3),3) #rep(a,b)는 a를 b만큼 반복
rep(1:3,3) #a:b는 a부터 b까지의 수
rep(c(4,2),times=2)
rep(c(4,2),times=c(2,1))
paste('no',1:3) #반복되는 문자에 첨자를 붙여줌

# 벡터 index 활용
vec1 <- c(1,2,3,4,5) # 1~5까지의 자료를 갖는 vec1변수 생성
vec1[2] #두번째 자료
vec1[c(2,3,5)] #vec1의 2,3,5의 값만 표현
vec1[c(-2,-3)] #vec1의 2,3번째 자료 값 삭제
vec1[vec1 > 2] #vec1에서 2보다 큰 값만 표현
vec1[2] <-6 #두번째 위치의 2값이 6으로 대체됨

replace(vec1,3,2) #vec1의 세번째 자료를 2로 변경
append(vec1,8,after=5) #vec1의 5번째 자료 다음에 8을 삽입

#행렬은 여러 변수들이 이차원적으로 모여있는 개체로,
#행렬을 생성하기 위해서는 matrix() 함수를 사용
#matrix() 함수 이외에 cbind(),rbind(),dim()을 이용하여 행렬을 생성시킬 수 있음

matrix(1:9,nrow=3) #nrow:행의 개수 지정
matrix(c(1,4,7,2,5,8,3,6,9),byrow = T,ncol=3) #ncol:열의 개수 지정, byrow=T : 행 기준 행렬을 생성
r1 <- c(1,4,7)
r2 <- c(2,5,8)
r3 <- c(3,6,9)
rbind(r1,r2,r3) # 행 기준으로 결합
cbind(r1,r2,r3) # 열 기준으로 결함

m1 <- 1.9
dim(m1) <- c(3,3)

#행렬과 관련된 여러 함수와 성분의 추출과 삭제 등에 관해 알아봄
mat <- matrix(c(1,2,3,4,5,6,7,8,9),ncol=3,byrow=T) #행 기준 3열의 행렬 생성
mat[1,] #행렬 Matdml 1행의 값
mat[,3] # 3열의 값
mat[mat[,3]>4,1] # 3열에서 4보다 큰 행의 값 중 1열의 모든값
mat[mat[,3]>4,2] # 3열에서 4보다 큰 행의 값 중 2열의 모든값
mat[2,drop=F] # 2행의 값만 행렬형태로 추출
is.matrix(mat[2,drop=F]) # mat[2,drop=F]가 행렬인지 확인

# 배열의 속성 : 행렬의 속성과 같이 자료의 개수를 나타내는 length, 형태를 보여주는 Mode,
# 각 차원의 벡터의 크기를 나타내는 dim, 각 차원의 리스트 이름을 나타내는 dimnames로 구성

# 배열의 생성 : array(), dim()

array(1:6) # 1~6으로 1차원배열 생성
array(1:6,c(2,3)) # 2차원 배열 생성
array(1:8,c(2,2,2)) # 3차원 배열 생성
arr <- c(1:24) # 1~24의 자료 생성
dim(arr) <-c(3,4,2) #dim()함수를 이용해 3행 4열 행렬 2개 생성

# 리스트 생성 함수

lst <- list('top',c(2,4,6),c(T,F,T)) # list(문자, 숫자, 논리형객체)
lst[[1]] # [[1]] :첫번째 성분
lst[1] # [1] : 첫번째 리스트
mat1 <- matrix(1:4,nrow=2)
list1 <- list('A',1:8,mat1)
son <- list(son.name = c('Minsu','Minchul'),son.cnt=2,son.age=c(2,6))

# 리스트 속성 
length(son) # 자료의 개수
mode(son) # 자료의 형태
names(son) # 각 구성요소의 이름

# 리스트 index 활용
a <- 1:10
b <- 11:15
klist <-list(vec1=a, vec2=b,descrip='example')
klist[[2]][5] # 2번째 성분 vec2의 5번째 원소
klist$vec2[c(2,3)] # vec2dml 2,3번째 원소

# 데이터프레임
# data.frame() : 이미 생성되어 있는 벡터들을 결합하여 데이터 프레임을 생성

char1 <- rep(LETTERS[1:3],c(2,2,1))
num1 <- rep(1:3,c(2,2,1))
test1 <- data.frame(char1,num1)

# as.data.frame() : 모든 다른 종류의 자료 객체들을 데이터 프레임으로 변환
a1 <- c('a','b','c','d','e','f','g','h','i','j','k','i','m','n','o')
dim(a1) <-c(5,3)
test3 <- as.data.frame(a1)

df1 <- data.frame(Col1 = c('A','B','C'), Col2=c(1,2,3), Col3=c(3,2,1))
#df1[행,열]
df1[,'Col3'] #3,2,1
df[1,] # A,1,3
df[3,'Col3'] #C

# 조건문 : 특정한 조건을 만족했을 경우에만 프로그램 실행, 항상 논리 연산이 수반된다.
x <- c(1,2,3,4)
y <- c(2,1,4,5)

if(sum(x) <sum(y))
  print(x) #x의 합이 y의 합보다 작을 경우 실행

ifelse(1 <2, 1,2)

# 함수

mean_fn <- function(data){
  result <- sum(data) / length(data)
  return(result)
}

x<- rnorm(100,mean=4,sd=1)
mean_fn(data=x)

# 산점도

## 점 범례 :legend(x,y,labels,pch=c(유형1,유형2))
## 선의 유형에 따른 범례 :legend(x,y,labels,lty=c(유형1,유형2))
## 선의 두께에 따른 범례 :legend(x,y,labels,lwd=c(유형1,유형2))
## 색상 범례 :legend(x,y,labels,col=c(유형1,유형2))

# 막대 그래프
hight_x <- c(120, 125, 130.5, 138, 142, 150)
barplot(hight_x)
barplot(hight_x, main='초등학생 평균 키', names.arg=c('1학년','2학년','3학년','4학년','5학년','6학년'),ylab='평균키(cm)')

# 히스토그램
data(Cars93,package='MASS')
hist(Cars93$MPG.city,main='City MPG (1933)',xlab='MPG')

hist(Cars93$MPG.city, breaks=20, main='City MPG (1933)',xlab='MPG')

# 상자 그림
x<- c(2,5,8,5,7,10,11,3,4,7,12,15)
y<- c(3.5,2.2,1.5,4.6,6.9)

boxplot(x,y)

tmp_df <- data.frame(gubun=c(rep(1,12),rep(2,5)),value=c(x,y))
boxplot(value~gubun, data=tmp_df)
