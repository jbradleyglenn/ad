NB. part i
NB. note: for a given machine, the best way presses a given button 0 or 1 times
load 'regex'
ma =: 1!:1 <'x.txt'
nums =: ('\[(.*)\]';,1) rxall ma
switches =: (_1 ". [: > '\d+' rxall ])&.>@:('\((\d+,)*\d+\)' rxall ])&.> LF splitstring ma

#.@:|.@:(I.^:_1)@> > {. switches

   22 b./~ #.@:|.@:(I.^:_1)@> > {. switches

   #. '#'= |. > {. nums

      (#. '#'= |. > {. nums) 22 b.^:4 #.@:|.@:(I.^:_1)@> > {. switches