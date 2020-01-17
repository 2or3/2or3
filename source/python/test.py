import sys

# Load File 
with open(sys.argv[1],'r', encoding='utf-8') as fp:
    arry = fp.read().split()
    l = len(arry)
    n = int(l**(1/2))
    for y in range(l - n, l):
        for x in range(n):
            print(arry[y-n*x]+ ' ', end='')
        print('\n')
