%1:
pred([], []).
pred([H | T], [H1 | T1]) :- H1 is H + 1, pred(T, T1).
%?- pred([1,2,3],[a,b,c]).
%false.
%?- pred([8,9],L).
%L = [9, 10].
%?- pred([1,2,3],[2,L]).
%false.
%?- pred([1,2],[2,X]).
%X = 3.
%o predicado soma +1 em todos elementos da lista.

%2:
ziplus([],[],[]).
ziplus([H|T], [H1|T1], L) :- ziplus(T, T1, X), S is H + H1, L = [S | X].  

%3:
countdown(0, [0]).
countdown(N, L) :- N >= 0, N1 is N - 1, countdown(N1, X), L = [N | X].

%4:
potencias(0, []).
potencias(N, L) :- aux(0, N, L).

aux(N1, N2, []) :- N1 =:= N2 .
aux(N1, N2, L) :-  N1 < N2, N3 is N1 + 1, aux(N3, N2, X), P is 2 ^ N1, L = [P | X].

%5:
positivos([], []).
positivos([H1 | T1], L) :- H1 >= 0, positivos(T1, X), L = [H1 | X]; H1 < 0, positivos(T1, X), L = X.

%6:
mesmaPosicao(false, [], []).
mesmaPosicao(X, [H1 | _], [H2 | _]) :- X == H1, H1 == H2.
mesmaPosicao(X, [_ | T1], [_ | T2]) :- mesmaPosicao(X, T1, T2).

%7:
intercala(_, [], []).
intercala(_, [H | []], [H]).
intercala(E, [H | T], L) :- length(T, Y), Y > 0, intercala(E, T, X), L = [H | [E | X]].

%8:
comissao(0, _, []).
comissao(NP, [H | T], C) :- NP > 0, N is NP - 1, comissao(N, T, X), C = [H | X].
comissao(NP, [_ | T], C) :- comissao(NP, T, C).

%9:
azulejos(0, 0).
azulejos(NA, NQ) :- NA > 0, sqrt(NA, R), floor(R, TQ), TQ1 is TQ ^ 2, QR is NA - TQ1, azulejos(QR, X), NQ is 1 + X.