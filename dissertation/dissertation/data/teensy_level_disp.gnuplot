set terminal cairolatex
set output "data/teensy_level_disp.tex"

data_filename = 'data/teensy_level_disp.csv'

set key left bottom

set datafile separator ','
set style data lines

set xrange [0:2500]

set yrange [-0.16:0.01]

set ytics autofreq
set ylabel 'acc ($ms^{-2}$), vel ($ms^{-1}$), disp ($m$)'

plot data_filename using 7 title 'Acceleration X', \
     data_filename using 8 title 'Acceleration Y', \
     data_filename using 10 title 'Velocity X', \
     data_filename using 11 title 'Velocity Y', \
     data_filename using 13 title 'Displacement X', \
     data_filename using 14 title 'Displacement Y'

