fmod =: 4 : 'x - ((<. x%y) * y)'

hsv2rgb =: monad define
h =. 0 { y
s =. 1 { y
v =. 2 { y
alpha =. 3 { y
c =. v * s
hprime =. h%60
xx =. c * (1-|(<: hprime fmod 2)) NB. x=c*(1-|h' mod 2 - 1|)
rgbtable =. 6 3 $ c,xx,0 , xx,c,0 , 0,c,xx , 0,xx,c , xx,0,c , c,0,xx
rgbselector =. <. hprime
m =. v-c
rgb =. m + rgbselector { rgbtable
255 * rgb,alpha
)

dlinea =: 3 : 0"1 2
0 0 0 dline y
:
Y=.x:^:_1 SC 2{."1 y
wd 'psel ',WIN_nam
glrgba x
glbrush ''
glpen 3 1
gllines <.0.5+,Y
' '[glpaint ''
)

dlineb =: 3 : 0"1 2
0 0 0 dline y
:
Y=.x:^:_1 SC 2{."1 y
wd 'psel ',WIN_nam
glrgba x
glbrush ''
glpen 4 1
gllines <.0.5+,Y
' '[glpaint ''
)

curve =: ((|: (0.5 -~ (%180) * i.180) ,: ((|. (^0.075*i.90)), (^0.075*i.90))%400) ,. 1)

dcurveRot =: dyad define
c =. curve mp (scale 0.185*x) mp (rotm _1p1) mp (trans 0,x) mp (rotm y)
(hsv2rgb ((360|90000*x^0.015),1.0 1.0 1.0)) dlinea c
)

dcurveRotA =: dyad define
c =. curve mp (scale 0.185*x) mp (rotm _1p1) mp (trans 0,x) mp (rotm y)
(hsv2rgb 0 0.2 0.2 0.15) dlineb c
)

drawCurves =: monad define
dcurveRot"0 0/ |:(,/ (0.005 * i.400) ,"0/ (1r11p1*i.22))
dcurveRotA"0 0/ |:(,/ (0.09 * i.50) ,"0/ (1r22p1+1r11p1*i.22))
)

dclear''
drawCurves''
