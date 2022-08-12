from re import A

#00110

a = '110'[::-1]
#011
for i in range(5-len(a)):
    a += '0'
    #01100
#00110
a = a[::-1]
print(a)