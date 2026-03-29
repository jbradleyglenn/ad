read =: 1 !: 1 @ <
NB. 1a
a1 =: +/ 1 _1 +/ . * '()' =/ read 'in1.txt'
NB. 1b
b1 =: >: _1 i.~ +/\ 1 _1 +/ . * '()' =/ read 'in1.txt'
NB. 2a
sizes =: |: _3 [\ _". (e.&(LF,'x'))`(,:&' ') } read 'in2.txt'
+/ , (+: , <./) 2 */\ (, {.) sizes
NB. 2b
+/ ((2 * [: <./ 2 +/\ (, {.)) + */) sizes
NB. 3a 
