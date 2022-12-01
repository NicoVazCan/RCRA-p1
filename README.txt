PRACTICA 1: 

Código en clingo para resolver problemas de hitori
Realizada por Nicolás Vázquez Cancela (nicolas.vazquez.cancela) y Martín Castro Fernández (martin.castro.fernandez)

USO:

python encode.py < [archivo.txt con el problema] > [archivo.lp con la instancia del problema codificado]
clingo 0 hitoriKB.lp [archivo.lp con la instancia del problema codificado] | python decode.py [nº de filas o columnas] > [archivo.txt con la solucion]



EJEMPLO 1:

python encode.py < EjemplosHitori/hitori1.txt > EjemplosHitori/hitori1.lp
clingo 0 hitoriKB.lp EjemplosHitori/hitori1.lp | python decode.py 5


EJEMPLO 2:

python encode.py < EjemplosHitori/hitori2.txt > EjemplosHitori/hitori2.lp
clingo 0 hitoriKB.lp EjemplosHitori/hitori2.lp | python decode.py 2


EJEMPLO 3:

python encode.py < EjemplosHitori/hitori3.txt > EjemplosHitori/hitori3.lp
clingo 0 hitoriKB.lp EjemplosHitori/hitori3.lp | python decode.py 5


EJEMPLO 4:

python encode.py < EjemplosHitori/hitori4.txt > EjemplosHitori/hitori4.lp
clingo 0 hitoriKB.lp EjemplosHitori/hitori4.lp | python decode.py 8


EJEMPLO 5:

python encode.py < EjemplosHitori/hitori5.txt > EjemplosHitori/hitori5.lp
clingo 0 hitoriKB.lp EjemplosHitori/hitori5.lp | python decode.py 8


EJEMPLO 6:

python encode.py < EjemplosHitori/hitori6.txt > EjemplosHitori/hitori6.lp
clingo 0 hitoriKB.lp EjemplosHitori/hitori6.lp | python decode.py 12
