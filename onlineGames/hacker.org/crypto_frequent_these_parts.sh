#!/bin/bash

# Challenge 'Frequent These Parts' [Crypto]
a="Uvgz ckzzff uhs qxuf hfvuirl vbzyecusczc, iuv xgx tyslu dg uvc toud tbggj ctihuolhlacat. W yt swbw uvya yqe, so oqwitsfh cp wetrsqg yjcqwhmwqoef rsdycy, wkvd iotl nq djpizse dbwbygug vrw fbayyrdapb. Uoep igv rm, fow gamz iuoy dzbh Khdcqstqyy iu dzf olzwgb lior dinv tswln yqe lp hfl nghl mstll. Vrat qgwhgb at ylvwp kk uvc ciiofffc, hnf sk iilkrgnk pt wlatc gmr. Ga iu ostwjf avdsdyck tjbgvuf mrgamfbaf apkdzggz. Iu dzbh fvw aym bdnyocmzfr ga? I'o wslwln a psuf zmug kxhvh rlxv sf pfblr vy hsctpdg tmth cuowqz eorh fqb qpip hncvqtwq. Ahg Ofhzgzh nkfhiyne ysdm pcarci lis nsakxlflr ahtymhv gas qgf qoraetxk. "

# Since it says:  This cipher is hundreds of years old. ... the answer is Vigenère cipher
## I assumed that Uvgz = this 

## using the table the four first letters are : boyh
## now  . W i assume is I > O 
## distance between V in uvyz and .W is = 

b="gz ckzzff uhs qxuf hfvuirl vbzyecusczc iuv xgx tyslu dg uvc toud tbggj ctihuolhlacat W"

echo $b | sed 's/[ \.,]//g' | wc -c #73 

# possible 8 - 9 .. so far I have boyh, let assume 8
# ctihuolhlacat. W
#     boyh    B  O 
#     tana    s  i

# using morewords.com
# cryptanalysis
# cryptanalyses
# cryptanalysts

# Thus,
# ctih =
# acks
# cryp

# key = boyhacks


# Using an online decoder
c="this cipher was once thought unbreakable, but now falls to the most basic cryptanalysis. i am sure that you, an aspiring or perhaps accomplished hacker, will have no trouble breaking the encryption. when you do, you will know that madagascar is the answer that will bring you to the next level. this cipher is known as the vigenere, and is hundreds of years old. it is easily attacked through frequency analysis. is that how you approached it? i'm making a nice long input text in order to provide just enough data for your analysis. the english language will betray the plaintext through its own patterns."
