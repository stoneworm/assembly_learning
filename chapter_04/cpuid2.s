#cpuid.s Sample program to extract the processor Vendor  ID
#        Using C libary calls
#        pushl is illegal instruction in x86-64 assembly, see following link for details
#        http://www.x86-64.org/documentation/assembly.html

.section .data
output:
  .asciz "The Processor Vendor ID is '%s'\n"

.section .bss
  .lcomm buffer, 12

.section .text
.global _start
_start:
movl  $0,%eax
cpuid
movl  $buffer, %edi
movl  %ebx, (%edi)
movl  %edx, 4(%edi)
movl  %ecx, 8(%edi)
pushl $buffer
pushl $output
call  printf
addq  $16, %esp
pushl $0
call  exit
