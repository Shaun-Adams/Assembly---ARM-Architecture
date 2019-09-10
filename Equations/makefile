all: SolvingEquations

SolvingEquations: SolvingEquations.o
	gcc -o $@ $+

SolvingEquations.o: SolvingEquations.s
	as -o $@ $<

clean:
	rm -vf SolvingEquations *.o
