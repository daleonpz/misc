#!/usr/bin/python2.7

# Challenge 'Growing Bacteria' [Misc]

def Fib(n):
    return  ( (1+5**0.5)**n - (1-5**0.5)**n  ) /(2**n*(5**0.5))


N = [ Fib(n) + Fib(n-1) + Fib(n-2) + Fib(n-3)  for n in range (55,60) ]

print range(55,60)

print N
    
