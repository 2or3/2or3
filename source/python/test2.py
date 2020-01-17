import sys

# Load File 
with open(sys.argv[1],'r', encoding='utf-8') as fp:
    result = list()
    for line in fp:
        l = line.split(' ')
        for v in range(len(l)):
            result.append
    print(result)
