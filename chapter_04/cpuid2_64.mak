%.o: %.s
	as -o $@ $<

cpuid2_64: cpuid2_64.o
	ld -dynamic-linker /lib/ld-linux-x86-64.so.2 -o $@ -lc $<
