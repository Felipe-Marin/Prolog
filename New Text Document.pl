solucao(Meninas, _, Hora) :-
  Meninas = [_,_,_,_,_,_,_,_],
  member(menina(lia, _, 8), Meninas),
  member(menina(mel, _, _), Meninas),
  member(menina(nanda, _, _), Meninas),
  member(menina(olga, _, _), Meninas),
  member(menina(pilar, _, _), Meninas),
  member(menina(rute, _, 8), Meninas),
  member(menina(sara, terca, 9), Meninas),
  member(menina(tina, _, _), Meninas),
  member(menina(nenhuma, quarta, Oito), Meninas).