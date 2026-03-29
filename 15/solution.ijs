read =: 1 !: 1 @ <
lines =: LF splitstring read
keep =: {{ (y e. x) } ' ' ,: y }} 
nums =: _ ". '0123456789' & keep 
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
# ~. +/\ 0j0 , 0j1 ^ '^>v<'i. read 'in3.txt'
NB. 3b
# ~. , +/\ 0 0 , _ 2 $ 0j1 ^ '^>v<'i. read 'in3.txt'
NB. 4a
NB. load'~addons/convert/misc/md5.ijs'
NB. key =: read 'in4.txt'
NB. '00000' i.~ 5&{."1 key {{ md5 x , ": y }}"(_ 0) i. 1000000
NB. 4b
NB. {{
NB.     i =: 1
NB.     while. 1 do.
NB.         if. '000000' -: 6 {. md5 key , ": i do. 
NB.             break. 
NB.         end.
NB.         i =: i + 1
NB.     end.
NB. }}''
NB. 5a 
c1 =: 3 <: [: +/ e.&'aeiou'
c2 =: 1 e. (= |.!.' ')
c3 =: 1 e. ('ab' , 'cd' , 'pq' ,: 'xy') e. 2&(]\)
+/ (c1 *. c2 *. -.@:c3)"1 > lines 'in5.txt'
NB. 5b 
c1 =: 1 e. 2 <: [: ({: - {.)@I. [: -:"1/~ 2&(]\)
c2 =: 1 e. [: (-: |.)"(1) 3&(]\)
+/ (c1 *. c2)"1 > lines 'in5.txt'