%.o: %.s
	as -o $@ $<

cpuid2: cpuid2.o
	ld -dynamic-linker /lib/ld-linux-x86-64.so.2 -o $@ -lc $<
