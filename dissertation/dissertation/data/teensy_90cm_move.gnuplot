set terminal cairolatex
set output "data/teensy_90cm_move.tex"

data_filename = 'data/teensy_90cm_move.csv'

set key left top

set datafile separator ','
set style data lines

set xrange [1100:2300]

set yrange [-3:3]
set y2range [-0.4:0.4]

set ytics autofreq
set ylabel 'acc ($ms^{-2}$)'

set y2tics autofreq
set y2label 'vel ($ms^{-1}$), disp ($m$)'

plot data_filename using 8 title 'Acceleration Y' lt rgb 'red', \
     data_filename using 11 title 'Velocity Y' lt rgb 'blue' axes x1y2, \
     data_filename using 14 title 'Displacement Y' lt rgb 'black' axes x1y2

