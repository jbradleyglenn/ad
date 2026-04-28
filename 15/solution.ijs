9 !: 37 ] 0 100 0 20
require 'convert/json'

read =: 1 !: 1 @ <
lines =: LF splitstring read
keep =: {{ (y e. x) } ' ' ,: y }} 
nums =: _ ". '_-0123456789' & keep 
words =: 'abcdefghijklmnopqrstuvwxyz' & keep
NB. 1a
a1 =: +/ 1 _1 +/ . * '()' =/ read 'i1.txt'
NB. 1b
b1 =: >: _1 i.~ +/\ 1 _1 +/ . * '()' =/ read 'i1.txt'
NB. 2a
sizes =: _3 [\ nums read 'i2.txt'
+/ , (+: , <./) 2 */\ (, {.) |: sizes
NB. 2b
vol =: */
circ =: +:@:(+/ - >./)
+/ (circ + vol) |: sizes
NB. 3a 
# ~. +/\ 0j0 , 0j1 ^ '^>v<'i. read 'i3.txt'
NB. 3b
# ~. , +/\ 0 0 , _ 2 $ 0j1 ^ '^>v<'i. read 'i3.txt'
NB. 4a
NB. load'~addons/convert/misc/md5.ijs'
NB. key =: read 'i4.txt'
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
+/ (c1 *. c2 *. -.@:c3)"1 > lines 'i5.txt'
NB. 5b 
c1 =: 1 e. 2 <: [: ({: - {.)@I. [: -:"1/~ 2&(]\)
c2 =: 1 e. [: (-: |.)"(1) 3&(]\)
+/ (c1 *. c2)"1 > lines 'i5.txt'
NB. 6a
irng =: {{ x + i. >: y - x }}
insts =: ( (1 i.~ (1 e. 'tog'&E.), (1 e. 'off'&E.) , (1 e. 'on'&E.)), nums )&> lines 'i6.txt'
lights =: 1000 1000 $ 0
{{
    sel =: < (irng/ 1 3 { y);(irng/ 2 4 { y)
    fn =: 1:`0:`-.@.({. y)
    lights =: fn &. (sel & {) lights
}}"1 insts
+/ , lights
NB. 6b
lights =: 1000 1000 $ 0
{{
    sel =: < (irng/ 1 3 { y);(irng/ 2 4 { y)
    fn =: >:`{{0 >. <: y}}`(2&+) @. ({. y)
    lights =: fn &. (sel & {) lights
}}"1 insts
+/ , lights
NB. 7a
NB. idea: topo sort, then eval
NB. ;: L: 0 '->'&splitstring&> lines 't7'
LC =: 'abcdefghijklmnopqrstuvwxyz'
'`NOT OR AND LSHIFT RSHIFT' =: (65535&-)`(23 b.)`(17 b.)`(65535 (17 b.) (33 b.)~)`(33 b.~ -)
I =: < @ ;: ;. _2 read 'i7'
nm =: (# ~ e. & LC @ {. @ >)&.> I
NB.          v c v a   v v v  c v  c  n a c  v  c v c v    v a v    v-------------  n
toponm =: (((; @ # ~) ([ , $: @(-. L: 1 ~)^:(*. & * & #)) (# ~ -.)) 1 & >: @ # @ >) nm
NB. this is a 7-train
NB. v  c  v  c  n   v  v n    v n  c v 
([: ". @ (;: ^: _1) {: , '=:' ; _3 & }.) @ > I /: toponm i. {: @ > I
a
NB. part b
b =: 956
([: ". @ (;: ^: _1) {: , '=:' ; _3 & }.) @ > 2 }. I /: toponm i. {: @ > I
NB. problem 8
+/ ((> / \. &. |. @ ('\'&=)) (2 + +/@[ + 2 * +/@:*.) '\x'&E.) @ > < ;. _2 read 'i8'
NB. part b
+/ (2 + +/ @ (e.&'\"')) @ > < ;. _2 read 'i8'
NB. 9a
i =: (+ |:) 0 ,~ 0 ,. |."1 |.@:((0&".)@>) /. / |: (0 _1&{) @ ;: ;. _2 read 'i9'
<./ (i.@! +/@(i (<"1@[ { ])~ 2 ]\ A.)"0 _ i.) # i
NB. 9b
>./ (i.@! +/@(i (<"1@[ { ])~ 2 ]\ A.)"0 _ i.) # i
NB. 10a
# ,@((# , {.) ;. 1 ~ (~: |. !. 0)) ^: 40 ". " 0 '1113122113'
NB. 10b
# ,@((# , {.) ;. 1 ~ (~: |. !. 0)) ^: 50 ". " 0 '1113122113'
NB. 11ab
lo =: 'abcdefghijklmnopqrstuvwxyz'
c1 =: [: -. 1 e. e.&8 14 11
c2 =: (1 < 1 (i: - i.)~ 2 =/\ ])
c3 =: (1 e. 1 1 E. 2 -~/\ ])
inc =: >:&.(26&#.)
lo {~ inc^:(-.@(c1 *. c2 *. c3))^:_ inc lo i. 'cqjxjnds'
lo {~ inc^:(-.@(c1 *. c2 *. c3))^:_ inc lo i. 'cqjxxyzz'
NB. 12ab
+/ nums read 'i12'
+/ nums enc_json ]`( ($:&.>)`]@.(2 = 3!:0) )`( ($: L: _1)`('censored'"_)@.((<'red') e. {:) )@.(#@$) dec_json read 'i12'
NB. 13a
i =: 0 _1 2 3 &{ @ ;: ;. _2 '.' -.~ read 'i13'
nm =: ~. {."1 i
gain =: 1
lose =: _1
j =: ((nm i. 2&{.) , (".@(2&{::)) * ".@(3&{::) )"1 i
m =: ({:"1 j) (< 2{."1 j)} (2 $ # nm)$ 0
>./ (i. (%~ !) # nm) +/@(m {~ [: < 2 ]\ [: (, 0: , |.)"1 ])@A."0 _ i. # nm
NB. 13b
m =: 0 ,"1~ 0 ,~ m
nm =: nm , < 'dc'
>./ (i. (%~ !) # nm) +/@(m {~ [: < 2 ]\ [: (, 0: , |.)"1 ])@A."0 _ i. # nm
NB. 14a
i =: ". @ > @ (3 8 _2&{) @ ;: ;. _2 read 'i14'
>./ +/@(2503 $ }. # {. , 0:)"1 i