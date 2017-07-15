set terminal cairolatex
set output "data/15_min_orientation_stability_teensy.tex"

data_filename = 'data/15_min_orientation_stability_teensy.csv'

set key right bottom

set datafile separator ','
set style data lines

set yrange [-0.1:0.1]
set y2range [-1.1:1.1]

set ytics autofreq
set ylabel 'quaternion coeffs. (x, y, z)'

set y2tics autofreq
set y2label 'quaternion coeffs. (w)'

plot data_filename using 1 title 'W' axes x1y2, \
     data_filename using 2 title 'X', \
     data_filename using 3 title 'Y', \
     data_filename using 4 title 'Z'

