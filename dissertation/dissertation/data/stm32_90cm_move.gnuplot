set terminal cairolatex
set output "data/stm32_90cm_move.tex"

data_filename = 'data/stm32_90cm_move.csv'

set key left top

set datafile separator ','
set style data lines

set xrange [1400:1900]

set yrange [-2.5:2.5]
set y2range [-0.6:0.6]

set ytics autofreq
set ylabel 'acc ($ms^{-2}$)'

set y2tics autofreq
set y2label 'vel ($ms^{-1}$), disp ($m$)'

plot data_filename using 8 title 'Acceleration Y' lt rgb 'red', \
     data_filename using 11 title 'Velocity Y' lt rgb 'blue' axes x1y2, \
     data_filename using 14 title 'Displacement Y' lt rgb 'black' axes x1y2

