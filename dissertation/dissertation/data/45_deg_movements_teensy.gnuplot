set terminal cairolatex
set output "data/45_deg_movements_teensy.tex"

data_filename = 'data/45_deg_movements_teensy.csv'

set key left bottom

set datafile separator ','
set style data lines

set ytics autofreq
set ylabel 'quaternion coeffs.'

plot data_filename using 1 title 'W', \
     data_filename using 2 title 'X', \
     data_filename using 3 title 'Y', \
     data_filename using 4 title 'Z'

