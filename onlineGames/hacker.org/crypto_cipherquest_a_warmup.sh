#!/bin/bash

# Challenge 'CipherQuest A Warmup' [Crypto]

a=" tulgqBmqBvuqbdhpslBtuclBmpBjpBfuzclstBjgsCBuztBxhtjBmpBvpfgzepBjpBbpctBdpgccqBehfk.BhBxpstBtuBjheBjuzepBgsqxgqBtuBezdodhepBjhmBxhtjBjumpmglpBeuzo.BhBxgckBhsBtuBjheBduumBuscqBtuBbhslBjhmBjuukhsCBzoBxhtjBmqBehetpd.BejpBfgstBldhap.BuzdBmumBlduapBjpdBtjpdp.Bbmc "

# B seems really suspicious so I assumed it was the space
b=$(echo $a | tr 'B' ' ')

# echo $b
# then I started to figure the character out one by one
c=$(echo $b | tr 'C' 'G' | tr 'h tu lgq mv bd ps c a j e z f x k o' 'I TO DAY MB FR EN L V H S U C W K P')

echo $c | sed -r 's/(.{25})/\1 /g' 
