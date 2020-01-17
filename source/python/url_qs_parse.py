from urllib.parse import parse_qs
import sys
import json

argvs = sys.argv

if (len(argvs) < 2):
    print('Please input URL as parameter.')
    quit()

url = argvs[1]
result = parse_qs(url)
format_json = json.dumps(result, indent=4, separators=(',', ': '))
print(format_json)
