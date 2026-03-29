read =: 1 !: 1 @ <
nums =: _ ". ((e.&'0123456789')`(' '&,:) })
NB. 1a
a1 =: +/ 1 _1 +/ . * '()' =/ read 'in1.txt'
NB. 1b
b1 =: >: _1 i.~ +/\ 1 _1 +/ . * '()' =/ read 'in1.txt'
NB. 2a
sizes =: _3 [\ nums read 'in2.txt'
+/ , (+: , <./) 2 */\ (, {.) |: sizes
NB. 2b
vol =: */
circ =: +:@:(+/ - >./)
+/ (circ + vol) |: sizes
NB. 3a 

