#include <stdio.h>
// Challenge 'Follow the Logic' [Coding]

int main(){
     int x = 2, y=5, z=3, a[] = {6, 5, 4, 9, 3, 7};

     int v = y * a[y] + z * a[z] - y * x * z + a[y] * a[x] * a[3];
     v = v + a[z] + a[y] + 11 * a[1] + a[0] - 1;

     printf("%i\n",v);
}


/* the code used in the source code of the web
function ff(answer) {
var x = 2;
var y = 5;
var z = 3;
var a = new Array(6, 5, 4, 9, 3, 7);
var v = y * a[y] + z * a[z] - y * x * z + a[y] * a[x] * a[3];
a.reverse; // troll , es como python ... si no se le asigna no pasa nada
v = v + a[z] + a[y] + 11 * a[1] + a[0] - 1;
if (answer == v) {
  return true;
}
else {
  alert("not it!");
  return false;
}
}
   */
