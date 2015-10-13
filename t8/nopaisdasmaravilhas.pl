%Inicio Codigo:
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

%Os horários da semana são representados por uma lista com 10 posições
%[segunda 8:00, segunda 9:00, terça 8:00, terça 9:00...]

q19e20(Meninas) :- 
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
  
q21(Meninas) :- 
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
  before(tina, sara, Meninas),
  before(nanda, sara, Meninas),
  repetido(Meninas),
  testamh(Meninas, lia, rute).
%fim codigo.

%Questao 19. Qual das alternativas seguintes poderia
%ser uma lista completa e correta das meninas
%testadas no horário das 8:00, de segunda a sextafeira?:
%(A) Olga, Nanda, nenhuma, Pilar, Tina.
%?- q19e20([olga, _, nanda, _, nenhuma, _, pilar, _, tina, _]).
%false.
%(B) Lia, Tina, nenhuma, Pilar, Rute.
%?- q19e20([lia, _, tina, _, nenhuma, _, pilar, _, rute, _]).
%false.
%(C) Olga, Pilar, nenhuma, Lia, Nanda.
%?- q19e20([olga, _, pilar, _, nenhuma, _, lia, _, nanda, _]).
%false.
%(D) Rute, Tina, nenhuma, Pilar, Mel.
% ?- q19e20([rute, _, tina, _, nenhuma, _, pilar, _, mel, _]).
%true .
%(E) Olga, Lia, nenhuma, Mel, Rute.
%?- q19e20([olga, _, lia, _, nenhuma, _, mel, _, rute, _]).
%false.
%Resposta Correta: D

%Questao 20:Se Nanda é testada sexta-feira, 8:00,
%qual é o dia e horário mais tarde na semana em
%que Mel poderia ser testada?:
%(A) Quinta-feira, 8:00
%(B) Quarta-feira, 9:00
%(C) Quinta-feira, 9:00
%(D) Sexta-feira, 9:00
%(E) Segunda-feira, 9:00
%começando o teste pelo horario mais tarde possivel:
%Sexta-feira, 9:00
%?- q19e20([_, _, _, _, _, _, _, _, nanda, mel]).
%false.
%Segundo horario mais tarde:
%Quinta-feira, 9:00
%?- q19e20([_, _, _, _, _, _, _, mel, nanda, _]).
%true .
%Resposta Correta: C, Quinta-feira, 9:00

%Questao 21. Se Tina e Nanda são testadas em algum
%momento antes de Sara, qual das seguintes
%alternativas não pode ser verdadeira?
%(A) Mel é testada em algum horário na quintafeira.
%?- q21([_, _, _, _, _, _, mel, _, _, _]).
%true .
%(B) Rute é testada quinta-feira, 8:00.
%?- q21([_, _, _, _, _, _, rute, _, _, _]).
%true .
%(C) Lia é testada quinta-feira, 8:00.
%?- q21([_, _, _, _, _, _, lia, _, _, _]).
%false.
%(D) Lia é testada quarta-feira, 9:00.
%?- q21([_, _, _, _, _, lia, _, _, _, _]).
%true .
%(E) Tina e Pilar são testadas no mesmo dia.
%?- q21([tina, pilar, _, _, _, _, _, _, _, _]).
%true .
%Resposta correta: C, lia quinta-feira, 8:00