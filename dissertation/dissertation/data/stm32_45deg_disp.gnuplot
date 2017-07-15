set terminal cairolatex
set output "data/stm32_45deg_disp.tex"

data_filename = 'data/stm32_45deg_disp.csv'

set key left bottom

set datafile separator ','
set style data lines

set xrange [800:1600]

set ytics autofreq
set ylabel 'acc ($ms^{-2}$), vel ($ms^{-1}$), disp ($m$)'

plot data_filename using 7 title 'Acceleration X', \
     data_filename using 8 title 'Acceleration Y', \
     data_filename using 10 title 'Velocity X', \
     data_filename using 11 title 'Velocity Y', \
     data_filename using 13 title 'Displacement X', \
     data_filename using 14 title 'Displacement Y'

