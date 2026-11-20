NB. MD5 of one string, written to follow the algorithm step by step.
M=: 4294967295
and=: 17 b.
or=: 23 b.
xor=: 22 b.
not=: M xor ]
rotl =: {{ M and (x 33 b. y) or (x-32) 33 b. y }}
K=: <. 4294967296 * | 1 o. >: i.64
S=: , 16 $"1 ] 4 4 $ 7 12 17 22 5 9 14 20 4 11 16 23 6 10 15 21
G=: 16 | (i.16) , (1+5*i.16) , (5+3*i.16) , 7*i.16
pad =:{{(a.i.y), 128, ((55-(#y))$0), |.(8$256)#:8*(#y)}}  NB. str -> uc[64]
words =: {{256#.|."1]_4]\y}}                              NB. uc[64] -> ui[16]
comp=: {{
    'a b c d'=. x
    for_i. i.64 do.
        select. <. i % 16                              
            case. 0 do. f=.(b and c) or (not b) and d     
            case. 1 do. f=.(d and b) or (not d) and c    
            case. 2 do. f=.b xor c xor d       
            case. 3 do. f=.c xor b or not d
        end.
        f=. M and f + a + (i{K) + (i{G){y
        'a b c d'=. d ; (M and b + (i{S) rotl f) ; b ; c 
    end.
    M and x + > a;b;c;d
}}
hex =: {{'0123456789abcdef'{~,16 16#:,|."1(4#256)#:y}}
s0 =:16b67452301 16befcdab89 16b98badcfe 16b10325476
md5one =: {{hex s0 comp words pad y}}
wordsN =: {{|: words"1 pad"1 y}}
md5N =: {{ hex"1 |: s0 comp wordsN y}}
