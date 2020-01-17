from urllib.parse import unquote
import sys

argvs = sys.argv

if (len(argvs) < 2):
    print('Please input URL as parameter.')
    quit()

url = argvs[1]
result = unquote(url)
print(result)
