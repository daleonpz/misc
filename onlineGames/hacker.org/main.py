#!/usr/bin/python2.7


# Challenge 'Go Forth' [Web]
from  BeautifulSoup import *
import urllib


url = "http://www.hacker.org/challenge/chal.php?id=57"

html = urllib.urlopen(url).read()
soup = BeautifulSoup(html)

# Retrieve a list of a anchor tags
# Each tag is like a dictionary of HTML attributes

tags = soup('a')

for tag in tags:
    print  (tag.get('href', None))


