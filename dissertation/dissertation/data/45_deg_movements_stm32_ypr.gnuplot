set terminal cairolatex
set output "data/45_deg_movements_stm32_ypr.tex"

data_filename = 'data/45_deg_movements_stm32_ypr.csv'

set key left top

set datafile separator ','
set style data lines

set xrange [800:4800]

set ytics autofreq
set ylabel 'Angle (degrees)'

plot data_filename using 1 title 'Yaw', \
     data_filename using 2 title 'Pitch', \
     data_filename using 3 title 'Roll'

