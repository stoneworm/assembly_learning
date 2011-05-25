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
movq  $0,%rax
cpuid
movq  $buffer, %rdi
movq  %rbx, (%rdi)
movq  %rdx, 4(%rdi)
movq  %rcx, 8(%rdi)
pushq $buffer
pushq $output
call  printf
addq  $16, %rsp
pushq $0
call  exit
