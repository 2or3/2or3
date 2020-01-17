import sys
import json

args = sys.argv
if len(args) > 1:
    json_text = json.loads(args[1])
    format_json = json.dumps(json_text, indent=4, separators=(',', ': '))
    print(format_json)
