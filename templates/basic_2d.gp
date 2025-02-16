set terminal qt enhanced font "arial,12" size 800, 600
set mouse
bind "q" "unset output; exit gnuplot"

set samples 50, 50
set xlabel "X " 
set ylabel "Y " 

set xrange[-2:2]
set yrange[-2:2]

f(x) = sin(x)

# set label at 2, 2, f(2,2) "" point pointtype 7 pointsize 2

plot [-10:10] f(x) 

pause mouse close

