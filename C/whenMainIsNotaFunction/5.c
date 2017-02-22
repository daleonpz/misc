int main(){
/*
 * The other approch is to use syscall. Im partially following the this blog : http://jroweboy.github.io/c/asm/2015/01/26/when-is-main-not-a-function.html
 *
 * He suggests the function syscall
 * Now, that I was able to manage printing on screen
 * the easy part is to get the opcode and make it a char array. 
 *
 * let's see if it works
 *
 * */	
	__asm__ (
	"movl $1, %eax;\n"  /* 1 is the syscall number for write on 64bit */
	"movl $1, %ebx;\n"  /* 1 is stdout and is the first argument */
	"movl $message, %esi;\n" /* load the address of string into the second argument*/
	"movl $10, %edx;\n"  /* third argument is the length of the string to print*/
	"syscall;\n"
	"movl $60,%eax;\n" // call exit
	"syscall;\n"
	 // Store the Hello World inside the main function
	"message: .ascii \"holi boli\\n\";"
	);
	return 0;
}

