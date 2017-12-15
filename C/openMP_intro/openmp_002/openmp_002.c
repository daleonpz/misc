/*
 *  OpenMP lecture exercises
 *  Copyright (C) 2011 by Christian Terboven <terboven@rz.rwth-aachen.de>
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 *
 */

#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <omp.h>


double CalcPi(int n);

int main(int argc, char **argv)
{
    int n = 150000000;
    const double fPi25DT = 3.141592653589793238462643;
    double fPi;
    double fTimeStart, fTimeEnd;
    
#ifdef READ_INPUT  
    printf("Enter the number of intervals: ");
    scanf("%d",&n);
#endif

    if (n <= 0 || n > 2147483647 ) 
    {
        printf("\ngiven value has to be between 0 and 2147483647\n");
        return 1;
    }
    fTimeStart = omp_get_wtime();

	
    /* the calculation is done here*/
    fPi = CalcPi(n);
	

    fTimeEnd = omp_get_wtime();
    printf("\npi is approximately = %.20f \nError               = %.20f\n",
           fPi, fabs(fPi - fPi25DT));
    printf("  wall clock time     = %.20f\n", fTimeEnd - fTimeStart);

    return 0;
}


double f(double a)
{
    return (4.0 / (1.0 + a*a));
}


double CalcPi(int n)
{
    const double fH   = 1.0 / (double) n;
    double fSum = 0.0;
    double fX;
    int i;

// time consuming 
// loop for
/*  NO PRAGMA
pi is approximately = 3.14159265359006845131 
Error               = 0.00000000000027533531
  wall clock time     = 1.51355518598575145006
*/

/* AFTER PRAGMA
pi is approximately = 0.97991465250752307625 
Error               = 2.16167800108227003975
  wall clock time     = 0.37933295499533414841
ERROR is so huge
*/


//#pragma omp parallel for  
#pragma omp parallel for \
 private(i) reduction(+:fSum)
    for (i = 0; i < n; i += 1)
    {
       fX = fH * ((double)i + 0.5);
    //    fSum += f(fX);
    	fSum += (4.0/ (1.0 + fX*fX));
    }
    return fH * fSum;
}

/*
 pi is approximately = 3.14159265359006845131 
Error               = 0.00000000000027533531
  wall clock time     = 1.50920873903669416904

pi is approximately = 3.14159265359023631703 
Error               = 0.00000000000044320103
  wall clock time     = 0.75595578702632337809

pi is approximately = 3.14159265358966566239 
Error               = 0.00000000000012745360
  wall clock time     = 0.50410991802345961332

pi is approximately = 3.14159265358999251205 
Error               = 0.00000000000019939606
  wall clock time     = 0.38167140306904911995

pi is approximately = 3.14159265358985928529 
Error               = 0.00000000000006616929
  wall clock time     = 0.25199815607629716396

pi is approximately = 3.14159265358974471027 
Error               = 0.00000000000004840572
  wall clock time     = 0.18921870202757418156

pi is approximately = 3.14159265358971540039 
Error               = 0.00000000000007771561
  wall clock time     = 0.18840291898231953382

pi is approximately = 3.14159265358981221183 
Error               = 0.00000000000001909584
  wall clock time     = 0.12556399195455014706

 * */
