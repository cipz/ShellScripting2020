set term postscript eps color blacktext 'Helvetica' 24
set output 'task34_plot_min-max-temps_generalized.eps'

set title 'MAX and min temperatures for month in input'
set xlabel 'Day of the month'
set ylabel 'Temperature in Celsius'

set style line 2 lt 1 lw 2 pt 1 linecolor 1

plot 'task35_plot_min-max-temps_generalized.txt' u 1:2 t "MAX Temperatures" pt 2 ps .1 with lines, \
     'task35_plot_min-max-temps_generalized.txt' u 1:3 t "MIN Temperatures" pt 2 ps .1 with lines