all: Fibonacci

Fibonacci: Fibonacci.o
	gcc -o $@ $+

Fibonacci.o : Fibonacci.s
	as -o $@ $<

clean:
	rm -vf Fibonacci *.o
