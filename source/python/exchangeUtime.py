import sys
from datetime import datetime

argvs = sys.argv

if (len(argvs) < 2):
    print('Please input unixtime as parameter.')
    quit()

if (not argvs[1].isdecimal()):
    print('Input parameter must be integer.')
    quit()

time = datetime.fromtimestamp(int(argvs[1]))
print(time)
