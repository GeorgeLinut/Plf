cmmdc(A,A,A).
cmmdc(A,B,D):-
	A>B,
	A1 is A-B,
	cmmdc(A1,B,D).
cmmdc(A,B,D):-
	A>B,
	B1 is B-A,
	cmmdc(A,B1,D).
cmmmc(A,B,M):-
	cmmdc(A,B,D),
	M is A*B/D.
cmmmclista([],1).
cmmmclista([H|T],M):-
	cmmmclista(T,M1),
	cmmmc(H,M1,M).

adauga(_,_,[],_,[]).
adauga(I,P,L,E,[E|R1]):-
	I=:=P,
	adauga(I+1,P*2,L,E,R1).
adauga(I,P,[H|T],E,[H|R]):-
	I\==P,
	adauga(I+1,P,T,E,R).

