빈리스트 =[]
for i in range(0,10): # 앞의 값 뒤의 값은 -1 10번 반복
    빈리스트.append(i)
    print("갯수",len(빈리스트)) #len .length() count() .len()
    print("나열",빈리스트)

과일 =['사과','배','딸기']
for i in range(0,len(과일)):
    print("과일:", 빈리스트[i])

# item, items 단수 복수
items = ['사과','배','딸기']
for item in items:
    print("과일:", 빈리스트[i])

# 2개를 가져오는데 (index, 값) 동시에 가져오기
for idx, item in enumerate(items):
    print(f"순서는{idx} 값은 {item}입니다.")

# % 엠퍼센드 나머지
import random

랜덤값 = random.randint(1,10)
# seed 시드값 = 상황재현
print(랜덤값)
print(dir(랜덤값))

# 예외 처리
try:
    import dfsfsfsdfs
except Exception as e:
    print(e)

