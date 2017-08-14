#!/usr/bin/python3

import subprocess
import json

test = subprocess.Popen(["i3-msg", "-t", "get_workspaces"], stdout=subprocess.PIPE)
outp = test.communicate()[0]

data = json.loads(outp.decode())

#data = sorted(data, key=lambda k : k["name"])

for i in data:
    print(i["name"])
