#!/usr/bin/env python

import subprocess
import sys

file_arg = sys.argv[1]

commands = [
    'flake8',
    'epylint',
]

results = ''

for command in commands:
    p = subprocess.Popen([command, file_arg], stdout=subprocess.PIPE)
    results += p.communicate()[0]

print(results)
