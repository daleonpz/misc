#!/usr/bin/python2.7

# Challenge 'Don't Blink' [Web]
import socket
mysock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
mysock.connect(('www.hacker.org',80))

# HTTP/1.0 web protocol
mysock.send('GET http://www.hacker.org/challenge/misc/one.php HTTP/1.0\n\n')

while True:
    # up to 512 character at a time
    data = mysock.recv(512)
    if ( len(data) <1 ):
        break
    print data
mysock.close()

