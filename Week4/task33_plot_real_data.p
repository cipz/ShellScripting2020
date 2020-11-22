set term postscript eps color blacktext 'Helvetica' 24
set output 'task33_plot_real_data.eps'

set title 'Max temperatures from November 2011'
set xlabel 'Day of the month'
set ylabel 'Temperature in Celsius'

set style line 2 lt 1 lw 2 pt 1 linecolor 1

plot 'task33_plot_real_data.txt' u 1:2 t "Temperatures" pt 2 ps .1 with lines