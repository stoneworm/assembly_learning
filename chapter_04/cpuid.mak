%.o: %.s
	as -o $@ $<

cpuid: cpuid.o
	ld -o cpuid cpuid.o
