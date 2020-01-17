import base64

import sys

argvs = sys.argv

if (len(argvs) < 2):
    print('Please input URL as parameter.')
    quit()

text = argvs[1]
result = base64.b64decode(text)
print(result)
