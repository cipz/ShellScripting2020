if (ascii eq 'true') {

     set terminal dumb
     set table "task36_min-max-temps_getops_wrapper_ascii_".output_file.".txt"

} else {

     set term postscript eps color blacktext 'Helvetica' 24
     set output "task36_min-max-temps_getops_wrapper_".output_file.".eps"

     set xlabel 'Day of the month'
     set ylabel 'Temperature in Celsius'

     set style line 2 lt 1 lw 2 pt 1 linecolor 1
}

if (max eq 'true') && (min eq 'true') {
     set title 'MAX and min temperatures for month in input'
     plot 'task36_min-max-temps_getops_wrapper.txt' u 1:2 t "MAX Temperatures" pt 2 ps .1 with lines, \
          'task36_min-max-temps_getops_wrapper.txt' u 1:3 t "MIN Temperatures" pt 2 ps .1 with lines ;
} else {
     if (min eq 'true'){
          set title 'min temperatures for month in input'
          plot'task36_min-max-temps_getops_wrapper.txt' u 1:2 t "min Temperatures" pt 2 ps .1 with lines ;
     }
     if (max eq 'true'){
          set title 'MAX temperatures for month in input'
          plot'task36_min-max-temps_getops_wrapper.txt' u 1:2 t "MAX Temperatures" pt 2 ps .1 with lines ;
     }
}

if (ascii eq 'true'){
     unset table
}