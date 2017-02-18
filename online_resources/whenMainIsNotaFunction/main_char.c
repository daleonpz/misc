char main[] = "holi boli \n";

/*
 * Output objdump -D 
 *
Disassembly of section .data:

0000000000601018 <__data_start>:
	...

0000000000601020 <__dso_handle>:
	...

0000000000601028 <main>:
  601028:	68 6f 6c 69 20       	pushq  $0x20696c6f
  60102d:	62                   	(bad)  
  60102e:	6f                   	outsl  %ds:(%rsi),(%dx)
  60102f:	6c                   	insb   (%dx),%es:(%rdi)
  601030:	69                   	.byte 0x69
  601031:	20 0a                	and    %cl,(%rdx)
	...

	Note that the hex code for "holi boli \n"
	appear in the assembly part  :)

	And main is in .data section, as a char array
	there is no ref to main in .text section
 
		 
       It seems that if we pass the rigth sequence of characters
we may be able to run this code and print "holi boli \n"
 * */
