ma =: _1". > ',' splitstring"_1 > LF splitstring 1!:1 <'viiii.txt'
>./ */"(1) 1+ | ,/ ma -"1"_ _1 ma 
NB. part i 4745816424
rects =: (<./ ,: >./)"2 ,/ ,:"1"_ _1~ ma
areas =: */"1 >: -~/"2 rects
nums =: ~. /:~ ,/ ma
maii =: nums i. ma
walls =: ~. ; <@{{ d&+^:(i. >: dist) {. y [ dist =: +/ | -~/y [ d=:* -~/ y}}"2] 2]\ maii, {. maii
rectsii =: (<./ ,: >./)"2 ,/ ,:"1"_ _1~ maii
>./ areas #~ walls -.@:(+./)@:(([: *./ ([ > {.@:]) , [ < {:@:])"1 2)"2 rectsii
NB. part ii 3077061808
