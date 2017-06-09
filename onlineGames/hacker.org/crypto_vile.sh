#!/bin/bash

# Challenge 'V.I.L.E.' [Crypto]
#+90+509+20+355+977+46+685+503+7+98+421+43+45+380+377
a="turkey  haiti egypt albania nepal sweden samoa elsalvador russia iran slovakia austria denmark ukranie monaco"

echo $a | sed 's/\(.\)[^ ]* */\1/g' 

