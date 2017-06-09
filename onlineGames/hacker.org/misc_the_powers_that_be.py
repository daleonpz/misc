#!/usr/bin/python2.7

# Challenge 'The Powers That Be' [Misc]

import re
a = str((17**39)**11)

print ''.join(re.findall('(.{1})[0-9]{32}',a))
