gnuplot_content=<<GPHEADEND
set terminal svg size 800,600 background "black"
set output 'palettes.svg'
set pm3d
set view map
set samples 500
set border 0
unset xtics; unset ytics; unset xlabel; unset ylabel; unset colorbox; unset key
set title offset graph 0 textcolor "white"
GPHEADEND

gpout = File.open 'plot.gplot', 'w'
gpout.puts gnuplot_content

palettes = ['color', 'gray','cubehelix', 'cubehelix start -1 cycles 0.9 saturation 1.5', 'rgbformulae 3,11,6', 'rgbformulae 34,35,36', 'rgbformulae 23,28,3', 'rgbformulae 21,22,23', 'rgbformulae 30,31,32', 'rgbformulae 33,13,10']
gpout.puts "set multiplot layout #{(palettes.size.to_f/2).ceil},2"

palettes.each do |palette|
  gpout.puts "set palette #{palette}; set title '#{palette}'"
  gpout.puts "splot x w pm3d"
end

gp_end = <<GPEND
unset multiplot
GPEND

gpout.puts gp_end
gpout.close