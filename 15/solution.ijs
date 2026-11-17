9 !: 37 ] 0 100 0 20
require 'convert/json'
read =: 1 !: 1 @ <
lines =: LF splitstring read
keep =: {{ (y e. x) } ' ' ,: y }} 
nums =: _ ". '_-0123456789' & keep 
words =: 'abcdefghijklmnopqrstuvwxyz' & keep

NB. NB. 1a
NB. a1 =: +/ 1 _1 +/ . * '()' =/ read 'i1.txt'
NB. NB. 1b
NB. b1 =: >: _1 i.~ +/\ 1 _1 +/ . * '()' =/ read 'i1.txt'
NB. NB. 2a
NB. sizes =: _3 [\ nums read 'i2.txt'
NB. +/ , (+: , <./) 2 */\ (, {.) |: sizes
NB. NB. 2b
NB. vol =: */
NB. circ =: +:@:(+/ - >./)
NB. +/ (circ + vol) |: sizes
NB. NB. 3a 
NB. # ~. +/\ 0j0 , 0j1 ^ '^>v<'i. read 'i3.txt'
NB. NB. 3b
NB. # ~. , +/\ 0 0 , _ 2 $ 0j1 ^ '^>v<'i. read 'i3.txt'
NB. NB. 4a
NB. NB. load'~addons/convert/misc/md5.ijs'
NB. NB. key =: read 'i4.txt'
NB. NB. '00000' i.~ 5&{."1 key {{ md5 x , ": y }}"(_ 0) i. 1000000
NB. NB. 4b
NB. NB. {{
NB. NB.     i =: 1
NB. NB.     while. 1 do.
NB. NB.         if. '000000' -: 6 {. md5 key , ": i do. 
NB. NB.             break. 
NB. NB.         end.
NB. NB.         i =: i + 1
NB. NB.     end.
NB. NB. }}''
NB. NB. 5a 
NB. c1 =: 3 <: [: +/ e.&'aeiou'
NB. c2 =: 1 e. (= |.!.' ')
NB. c3 =: 1 e. ('ab' , 'cd' , 'pq' ,: 'xy') e. 2&(]\)
NB. +/ (c1 *. c2 *. -.@:c3)"1 > lines 'i5.txt'
NB. NB. NB. 5b 
NB. NB. c1 =: 1 e. 2 <: [: ({: - {.)@I. [: -:"1/~ 2&(]\)
NB. NB. c2 =: 1 e. [: (-: |.)"(1) 3&(]\)
NB. NB. +/ (c1 *. c2)"1 > lines 'i5.txt'
NB. NB. NB. 6a
NB. NB. irng =: {{ x + i. >: y - x }}
NB. NB. insts =: ( (1 i.~ (1 e. 'tog'&E.), (1 e. 'off'&E.) , (1 e. 'on'&E.)), nums )&> lines 'i6.txt'
NB. NB. lights =: 1000 1000 $ 0
NB. NB. {{
NB. NB.     sel =: < (irng/ 1 3 { y);(irng/ 2 4 { y)
NB. NB.     fn =: 1:`0:`-.@.({. y)
NB. NB.     lights =: fn &. (sel & {) lights
NB. NB. }}"1 insts
NB. NB. +/ , lights
NB. NB. NB. 6b
NB. NB. lights =: 1000 1000 $ 0
NB. NB. {{
NB. NB.     sel =: < (irng/ 1 3 { y);(irng/ 2 4 { y)
NB. NB.     fn =: >:`{{0 >. <: y}}`(2&+) @. ({. y)
NB. NB.     lights =: fn &. (sel & {) lights
NB. NB. }}"1 insts
NB. NB. +/ , lights
NB. NB. 7a
NB. NB. idea: topo sort, then eval
NB. NB. ;: L: 0 '->'&splitstring&> lines 't7'
NB. LC =: 'abcdefghijklmnopqrstuvwxyz'
NB. '`NOT OR AND LSHIFT RSHIFT' =: (65535&-)`(23 b.)`(17 b.)`(65535 (17 b.) (33 b.)~)`(33 b.~ -)
NB. I =: < @ ;: ;. _2 read 'i7'
NB. nm =: (# ~ e. & LC @ {. @ >)&.> I
NB. NB.          v c v a   v v v  c v  c  n a c  v  c v c v    v a v    v-------------  n
NB. toponm =: (((; @ # ~) ([ , $: @(-. L: 1 ~)^:(*. & * & #)) (# ~ -.)) 1 & >: @ # @ >) nm
NB. NB. this is a 7-train
NB. NB. v  c  v  c  n   v  v n    v n  c v 
NB. ([: ". @ (;: ^: _1) {: , '=:' ; _3 & }.) @ > I /: toponm i. {: @ > I
NB. a
NB. NB. part b
NB. b =: 956
NB. ([: ". @ (;: ^: _1) {: , '=:' ; _3 & }.) @ > 2 }. I /: toponm i. {: @ > I
NB. NB. problem 8
NB. +/ ((> / \. &. |. @ ('\'&=)) (2 + +/@[ + 2 * +/@:*.) '\x'&E.) @ > < ;. _2 read 'i8'
NB. NB. part b
NB. +/ (2 + +/ @ (e.&'\"')) @ > < ;. _2 read 'i8'
NB. NB. 9a
NB. i =: (+ |:) 0 ,~ 0 ,. |."1 |.@:((0&".)@>) /. / |: (0 _1&{) @ ;: ;. _2 read 'i9'
NB. <./ (i.@! +/@(i (<"1@[ { ])~ 2 ]\ A.)"0 _ i.) # i
NB. NB. 9b
NB. >./ (i.@! +/@(i (<"1@[ { ])~ 2 ]\ A.)"0 _ i.) # i
NB. NB. 10a
NB. # ,@((# , {.) ;. 1 ~ (~: |. !. 0)) ^: 40 ". " 0 '1113122113'
NB. NB. 10b
NB. # ,@((# , {.) ;. 1 ~ (~: |. !. 0)) ^: 50 ". " 0 '1113122113'
NB. NB. 11ab
NB. lo =: 'abcdefghijklmnopqrstuvwxyz'
NB. c1 =: [: -. 1 e. e.&8 14 11
NB. c2 =: (1 < 1 (i: - i.)~ 2 =/\ ])
NB. c3 =: (1 e. 1 1 E. 2 -~/\ ])
NB. inc =: >:&.(26&#.)
NB. lo {~ inc^:(-.@(c1 *. c2 *. c3))^:_ inc lo i. 'cqjxjnds'
NB. lo {~ inc^:(-.@(c1 *. c2 *. c3))^:_ inc lo i. 'cqjxxyzz'
NB. NB. 12ab
NB. +/ nums read 'i12'
NB. +/ nums enc_json ]`( ($:&.>)`]@.(2 = 3!:0) )`( ($: L: _1)`('censored'"_)@.((<'red') e. {:) )@.(#@$) dec_json read 'i12'
NB. NB. 13a
NB. i =: 0 _1 2 3 &{ @ ;: ;. _2 '.' -.~ read 'i13'
NB. nm =: ~. {."1 i
NB. gain =: 1
NB. lose =: _1
NB. j =: ((nm i. 2&{.) , (".@(2&{::)) * ".@(3&{::) )"1 i
NB. m =: ({:"1 j) (< 2{."1 j)} (2 $ # nm)$ 0
NB. >./ (i. (%~ !) # nm) +/@(m {~ [: < 2 ]\ [: (, 0: , |.)"1 ])@A."0 _ i. # nm
NB. NB. 13b
NB. m =: 0 ,"1~ 0 ,~ m
NB. nm =: nm , < 'dc'
NB. >./ (i. (%~ !) # nm) +/@(m {~ [: < 2 ]\ [: (, 0: , |.)"1 ])@A."0 _ i. # nm
NB. NB. 14a
NB. i =: ". @ > @ (3 8 _2&{) @ ;: ;. _2 read 'i14'
NB. >./ +/@(2503 $ }. # {. , 0:)"1 i
NB. NB. 14b
NB. >./ +/ (= >./)"1 |: +/\@(2503 $ }. # {. , 0:)"1 i
NB. NB. 15a
NB. i =: (#~ 100 = +/"1) 101 101 101 101 #:"_ 0 ] i. 101 ^ 4
NB. m =: nums ;. _2 read 'i15'
NB. >./ */"(1) 0 >. i +/ . * }:"1 m
NB. NB. 15b
NB. >./ */"(1) 0 >. }:"1 (#~ 500 = {:"1) i +/ . * m
NB. NB. 16a
NB. aunt =: 0 2 7 3 5 1 3 2 3 0
NB. keys =: ('akitas';'cars';'cats';'children';'goldfish';'perfumes';'pomeranians';'samoyeds';'trees';'vizslas')
NB. auntsbig =: {{ ({: y) ({. y)} 10 $ _ }}"2 ((keys i. {.) ,: ".@>@{:) @ ([: |: _2 ]\ 2 }. ]) @ ;: ;. _2 (#~ [: -. ':,' e.~ ]) read 'i16'
NB. auntsmall =: {{ ({: y) ({. y)} 10 $ __ }}"2 ((keys i. {.) ,: ".@>@{:) @ ([: |: _2 ]\ 2 }. ]) @ ;: ;. _2 (#~ [: -. ':,' e.~ ]) read 'i16'
NB. >: {. I. *./"1 (auntsmall <:"1 aunt) *. (auntsbig >:"1 aunt)
NB. NB. 16b
NB. >: I. (*./"1 auntsmall <:&(0 1 3 5 7 9&{)"1 aunt) *. (*./"1 auntsbig >:&(0 1 3 5 7 9&{)"1 aunt) *. (*./"1  auntsbig >&(2 8&{)"1 aunt) *. (*./"1 auntsmall <&(4 6&{)"1 aunt)


NB. clue =: ([ ^: (__ e. ]) __ & ".) &. > @ ;: ;. _2 ] 0 : 0
NB. children: 3
NB. cats: 7
NB. samoyeds: 2
NB. pomeranians: 3
NB. akitas: 0
NB. vizslas: 0
NB. goldfish: 5
NB. trees: 3
NB. cars: 2
NB. perfumes: 1
NB. )
NB. names =: {."1 clue
NB. db =: <@:(2&}.)@(([^:(__ e. ]) __&".)&.>@;:);._2 ',' -.~ (#~ [: -. (LF,LF)&E.) read 'i16'
NB. dbflat =: (names (1&{::"1@])`(i. {."1)`(_"0@[)} _2&(]\))@> db
NB. >: I. dbflat *./@((_ ~: [) # =)"1 clueval

NB. 17a
+/ 150 = +/"1 (#~ #:@i.@(2 ^ #)) nums read 'i17'
NB. 17b
+/ (= <./) +/"1 ] 0 ~: (#~ 150 = +/"1) (#~ #:@i.@(2 ^ #)) nums read 'i17'
NB. 18a
+/ +/ {{(4&{ ((-.@[ * 3 = ]) + [ * 2 3 e.~ ]) 0 1 2 3 5 6 7 8 +/@:{ ])"1 ] 3 3 , ;. _3 ] 102 102 {. _101 _101 {. y}}^:100 '#' = ] ;. _2 read 'i18'
NB. 18b
+/ +/ {{1 (<0 0 , 0 99 , 99 0 ,: 99 99)} (4&{ ((-.@[ * 3 = ]) + [ * 2 3 e.~ ]) 0 1 2 3 5 6 7 8 +/@:{ ])"1 ] 3 3 , ;. _3 ] 102 102 {. _101 _101 {. y}}^:100 ] 1 (<0 0 , 0 99 , 99 0 ,: 99 99)} '#' = ] ;. _2 read 'i18'
NB. 19a
rules =: _2 }. ' => '&(taketo ; takeafter) ;. _2 read 'i19'
mol =: > {: < ;. _2 read 'i19'
replace =: {{ <@;"1 ({: x) {{ ({. y) , x , ({: y) }}"1 (|: (,: (# 0 {:: x)&+) I. (0 {:: x) E. y) {{ (({. x) {. y) ; ({: x) }. y }}"1 y }}
# ~. ; rules <@replace"1 mol
NB. 19b
NB. 1 3 18 105 607 3566 21287 129071 793306 4933735
NB. rul =: ' => '&(takeafter ; taketo) ;. _2 ] 0 : 0
NB. e => H
NB. e => O
NB. H => HO
NB. H => OH
NB. O => HH
NB. )
NB. start =: ,: < 'HOHOHO'

rul =: _2 }. ' => '&(takeafter ; taketo) ;. _2 read 'i19'
gen =: ~. @: (; @ ({{ < <@({.&(> y) , (>{:x) , (>y) }.~ (#>{.x) + ])"0 I. (> {. x) E. > y}}"1 0/))
mol =: ,: {: < ;. _2 read 'i19'
{{
    i =: 0
    while. -. (< ,: 'e') e. mol do. 
        i =: i + 1
        mol =: rul gen mol 
    end.
}} ''


