%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Universidade Federal da Bahia%%
%%%%%%%%Marino Hohenheim%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%Questão 1
%Escreva as cláusulas para concatenar duas listas.
%a) Em PROLOG: concatenar(L1,L2,L3).
%Por exemplo:
%?- concatenar([a,b,c],[d,e,f,g,h], L).
%Deve retornar:
%L = [a,b,c,d,e,f,g,h].

concatenar([],[],[]).
concatenar([], L, L).
concatenar([X|R], L, [X|W]):-
	concatenar(R, L, W).


%Questão 2
%Escreva as cláusulas para concatenar duas listas, sendo que a segunda lista vem na frente.
%a) Em PROLOG: concatenarInv(L1,L2,L3). Neste caso dê exemplos das metas.
%Por exemplo:
%?- concatenarInv([a,b,c],[d,e,f,g,h], L).
%Deve retornar:
%L = [d,e,f,g,h,a,b,c].

concatenarInv(L, [], L).
concatenarInv(L1, L2, L3):-
	concatenar(L2, L1, L3).



%Questão 3
%Escreva as cláusulas para concatenar uma lista de listas.
%a) Em PROLOG: concatenar(LL,L).
%Por exemplo:
%?- concatenar([[a,b],[c],[e,f,g]], L).
%Deve retornar:
%L = [a,b,c,d,e,f,g].

concatenarLL([], []):- !.
%concatenarLL([L], L):- !.
concatenarLL([X|R], W):-
	concatenarLL(R, WT),
	concatenar(X, WT, W).


%Questão 4
%Escreva as cláusulas para juntar duas listas, intercalando seus elementos.
%b) Em PROLOG: juntar(L1,L2,L3).
%Por exemplo:
%?- juntar([a,b,c],[d,e,f,g,h], L).
%Deve retornar:
%L = [a,d,b,e,c,f,g,h].


juntar(L, [], L):- !.
juntar([], L, L):- !.
juntar([X|L1], [Y|L2], [X,Y|L3]):-
	juntar(L1, L2, L3).


%Questão 5
%Escreva as cláusulas para adicionar um elemento ao final de uma lista.
%a) Em PROLOG: adicionarFinal(E,X,L).
%Por exemplo:
%?- adicionarFinal(z,[a,b,c], L).
%Deve retornar:
%L = [a,b,c,z].

adicionarFinal(X,[],[X]).
adicionarFinal(X,[Y|L], [Y|W]):-
	adicionarFinal(X, L, W).



%Questão 6
%Escreva as cláusulas para inverter uma lista.
%a) Em PROLOG: inverter(L,Linv).
%Por exemplo:
%?- inverter([a,b,c], L).
%Deve retornar:
%L = [c,b,a].

inverter([], []).
inverter([X], [X]).
inverter([X|R], L):-
	inverter(R, W),
	adicionarFinal(X, W, L).



%Questão 7
%Escreva as cláusulas parear que recebe um elemento E e uma lista L, e produz a lista de pares cujo primeiro
%elemento é E e o segundo elemento é um membro de L.
%a) Em PROLOG: parear(E,L,LL).
%Por exemplo:
%?- parear(x,[a,b,c], LL).
%Deve retornar:
%LL = [[x,a],[x,b],[x,c]].

parear(_, [], []):- !.
%parear(X, [Y], [X,Y]):- !.
parear(X, [Y|R], [[X,Y]|W]):-
	parear(X, R, W).



%Questão 8
%Escreva as cláusulas pares que recebe um elemento uma lista L, e produz a lista de todos os pares de elementos de
%L.
%b) Em PROLOG: pares(L,LL).
%Por exemplo:
%?- pares([a,b,c,d], LL).
%Deve retornar:
%L = [[a, b], [a, c], [a, d], [b, c], [b, d], [c, d]].

pares([], []):- !.
pares([X|R], W):-
	parear(X, R, LR),
	pares(R, W1),
	concatenar(LR, W1, W).


%Questão 9– Difícil.
%Escreva as cláusulas para produzir todas as permutações dos elementos de uma lista.
%c) Em PROLOG: permutar(L1,L). Produz uma solução para cada permuta.
%Por exemplo:
%?- permutar([1,2,3],L).
%L = [1, 2, 3];
%L = [1, 3, 2];
%L = [2, 1, 3];
%L = [2, 3, 1];
%L = [3, 1, 2];
%L = [3, 2, 1];
%false.
%Dica: use a função remova vista em sala:
%remova(X,[X|T],T).
%remova(X,[H|T],[H|NT]):- remova(X,T,NT).
%Sabendo que:
%?- remova(X,[a,b,c],R).
%X = a,
%R = [b, c];
%X = b,
%R = [a, c];
%X = c,
%R = [a, b];
%false.
%
%
%
%
%
%
%
%Questão 10
%Escreva as cláusulas que recebe uma lista e testa se ela tem elementos repetidos (pode ser interpretada como um conjunto). OBS: A expressão \+ faz a negação de uma cláusula.
%a) Em PROLOG: conjunto(L).
%Por exemplo:
%?- conjunto([a,b,c,d]).
%true.
%?- conjunto([a,b,d,c,d]).
%false.
%Questão 11
%Escreva as cláusulas que recebe duas listas e testa se a primeira é prefixo da segunda.
%a) Em PROLOG: prefixo(L1,L2).
%Por exemplo:
%?- prefixo([a,b,c],[a,b,c,d,e,f,g]).
%true.
%?- prefixo([a,b,c],[a,b,f,g]).
%false.







%Questão 12
%Escreva as cláusulas que recebe duas listas e testa se a primeira é subseqüência da segunda.
%a) Em PROLOG: subsequencia(L1,L2).
%Por exemplo.
%?- subsequencia([a,b,c],[d,z,a,b,c,f,g]).
%true .
%?- subsequencia([a,b,c],[d,z,a,b,f,c,g]).
%false
