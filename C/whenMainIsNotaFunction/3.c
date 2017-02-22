char main[] = { 0x55,
	0x48, 0x89, 0xe5,
	0xbf, 0x94, 0x05, 0x40, 0x00,
	0xe8, 0xec, 0xfe, 0xff, 0xff,
	0xb8, 0x00, 0x00, 0x00, 0x00,
	0x5d,
	0xc3,
	0x0f, 0x1f, 0x44, 0x00, 0x00,
};


 /*
  * disas code from common_main.c
  4004f6:	55                   	push   %rbp
  4004f7:	48 89 e5             	mov    %rsp,%rbp
  4004fa:	bf 94 05 40 00       	mov    $0x400594,%edi
  4004ff:	e8 ec fe ff ff       	callq  4003f0 <puts@plt>
  400504:	b8 00 00 00 00       	mov    $0x0,%eax
  400509:	5d                   	pop    %rbp
  40050a:	c3                   	retq   
  40050b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

  I thought that just by copy the opcode will work, but I forget 
  that "main" from common_main.c is in .text section
  and  "char main" is in .data section. Thus, the offsets must be
  modified.

  let's check in which address the GOT.plt for printf ("puts@plt").. oohhh shit! ,obviously the linker didn't link printf   since there is no referente to that function... let's  try another approach :)

  we shouldn't use printf 

*/
