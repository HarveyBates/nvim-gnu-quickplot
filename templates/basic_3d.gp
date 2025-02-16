set terminal qt enhanced font "arial,12" size 800, 600
set mouse
bind "q" "unset output; exit gnuplot"

set hidden3d
set dgrid3d
set samples 50, 50
set isosamples 50, 50
set view 45, 30
set style data lines

set xlabel "X " 
set ylabel "Y " 
set zlabel "Z " 

f(x,y) = exp(x * y)
g(x,y) = x**3 + y**3

set xrange[-2:2]
set yrange[-2:2]

set label at 2, 2, f(2,2) "" point pointtype 7 pointsize 2
splot f(x,y), g(x,y) 

pause mouse close

