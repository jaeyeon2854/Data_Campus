for i in range(0,9):
    print(f"{i+1}단".center(10,"*"))
    for ii in range(0,9):
        print(f"{i+1} X {ii+1} = {(i+1) * (ii+1)}\n", end='')

for i in range(1,10):
    if i % 2 == 0:
        print(f"짝수단".center(10,'*'))
        for ii in range(1,10):
            print(f"{i} X {ii} = {(i) * (ii)}\n", end='')

    else:
        print(f"홀수단".center(10,'*'))
        for ii in range(1,10):
            print(f"{i} X {ii} = {(i) * (ii)}\n", end='')


구구단 = [(i)*(ii) for i in range(1,10) for ii in range(1,10)]
구구단.sort()
print(구구단)
구구단.reverse()
print(구구단)

def 적용될함수(x):
    return x +"맛있당"

리스트 = ["사과","수박","딸기"]
맵적용된리스트 = list(map(적용될함수,리스트))
print(맵적용된리스트)

리스트 = ["사과","수박","딸기"]
람다가적용된리스트 = list(map(lambda x:x+"맛있당",리스트))
print(람다가적용된리스트)

리스트 = ["사과","수박","딸기"]
필터가적용된리스트 = list(filter(lambda x:x =="사과",리스트))
print(필터가적용된리스트)