#!/bin/python

# [gesamtausgabe, meine ausgabe]

allgemein       = [ 219.73, 112.15]
DM              = [ 74.40,  54.40]
lebensmiteln    = [ 398.25, 321.94]

to_pay_allgemein    = (allgemein[0]/2.0 - allgemein[1])
to_pay_dm           = (DM[0]/2.0 - DM[1])  
to_pay_lebensmittel = (lebensmiteln[0]*2.0/3.0 - lebensmiteln[1])

to_pay  = to_pay_allgemein + to_pay_dm + to_pay_lebensmittel

print(f'Allgemein {to_pay_allgemein}')
print(f'DM {to_pay_dm}')
print(f'Lebensmitteln {to_pay_lebensmittel}')
print(f'an Ina Überweisen {to_pay}')
