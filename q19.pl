ao_lado(X, Y, List) :- nextto(X, Y, List). % X à esquerda de Y
ao_lado(X, Y, List) :- nextto(Y, X, List). % Y à esquerda de X

before(A, B, [_ | T]) :- before(A, B, T).
before(A, B, [A|T]) :- member(B, T).

indexof(A, [], _) :- member(A, []).
indexof(A, [A|_], 0).
indexof(A, [_|T], P) :- indexof(A, T, P1), P is P1 + 1, !.

testamh(L, A, B) :- indexof(A, L, P), H is mod(P, 2), H == 0, indexof(B, L, P1), H1 is mod(P1, 2), H1 == 0;
  indexof(A, L, P), H is mod(P, 2), H == 1.

repetido(L) :- sort(L, S), length(L, A), length(S, B), A == B.


geralista(Meninas) :- 
  Meninas = [_,_,_,sara,nenhuma,_,_,_,_,_],
  member(lia, Meninas),
  member(rute, Meninas),
  member(nanda, Meninas),
  member(tina, Meninas),
  member(mel, Meninas),
  member(olga, Meninas),
  member(pilar, Meninas),
  member(vazio, Meninas),
  ao_lado(olga, mel, Meninas),
  before(pilar, nanda, Meninas),
  repetido(Meninas),
  testamh(Meninas, lia, rute).