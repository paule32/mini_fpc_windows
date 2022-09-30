	.file	"dllMain.cc"
	.text
/APP
	.text                    
.p2align 4               
.globl DllMainCRTStartup 
DllMainCRTStartup:	  
movq $1, %rax	  
ret		  

