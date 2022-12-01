{negro(C)} :- celda(C,_).

:- negro(cord(X,Y)),negro(cord(X+1,Y)).
:- negro(cord(X,Y)),negro(cord(X,Y+1)).

:- celda(cord(X1,Y),V),celda(cord(X2,Y),V),X1!=X2,not negro(cord(X1,Y)),not negro(cord(X2,Y)).
:- celda(cord(X,Y1),V),celda(cord(X,Y2),V),Y1!=Y2,not negro(cord(X,Y1)),not negro(cord(X,Y2)).


% Primer planteamiento para representar que todas las celdas blancas esten conectadas, mediante tuplas
% de cordenadas representado la adyacencia entre esas celdas blancas, en las que se conectan por transitividad.

%conectado(cord(X,Y),cord(X+1,Y)) :- not negro(cord(X,Y)),not negro(cord(X+1,Y)),celda(cord(X,Y),_).
%conectado(cord(X,Y),cord(X,Y+1)) :- not negro(cord(X,Y)),not negro(cord(X,Y+1)),celda(cord(X,Y),_).
%conectado(C1,C3) :- conectado(C1,C2), conectado(C2,C3), C1!=C3.
%conectado(C1,C2) :- conectado(C2, C1).

%:- not negro(C1),not negro(C2),C1!=C2,not conectado(C1,C2),celda(C1,_),celda(C2,_).


% Se ha planteado de forma alternativa ya que la anterior es muy ineficiente, de forma en que
% se genere una lista de celdas blancas conectadas por un camino, partiendo de una primera
% o segunda celda blanca (al poder ser negra una de las dos posiciones) en la primera o
% última fila o columna, para luego comprobar si todas las celdas blancas se encuentran en la lista.

conectado(C) :- not negro(C),C=cord(1,1),celda(C,_).
conectado(C) :- not negro(C),C=cord(2,1),celda(C,_).
% Como dos celdas contiguas en la misma fila no pueden ser simultaneamente negras, es un punto seguro de
% comienzo para generar el camino recursivamente ya que al menos una de las dos tiene que ser blanca

conectado(cord(X,Y)) :- conectado(cord(X+1,Y)),not negro(cord(X,Y)),X<n,celda(cord(X,Y),_).
conectado(cord(X,Y)) :- conectado(cord(X-1,Y)),not negro(cord(X,Y)),X>1,celda(cord(X,Y),_).
conectado(cord(X,Y)) :- conectado(cord(X,Y+1)),not negro(cord(X,Y)),Y<n,celda(cord(X,Y),_).
conectado(cord(X,Y)) :- conectado(cord(X,Y-1)),not negro(cord(X,Y)),Y>1,celda(cord(X,Y),_).

:- not negro(C),not conectado(C),celda(C,_).
