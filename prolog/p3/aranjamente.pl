member([H|_],H).
member([_|T],E):-
	member(T,E).
len([],0).
len([H|T],R):-
	len(T,R1),
	R is R1+1.
aranj(_,C,C,LU,LU).
aranj(L,C,R,L1,L2):-
	member(L,T),
	not(member(C,T)),
	L11 is L1+1,
	aranj(L,[T|C],R,L11,L2).
deranj(L,Rez,K):-
	aranj(L,[],Rez,0,K).
main(L,R,K):-
	findall(T,deranj(L,T,K),R).
