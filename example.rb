require 'rsvg'

doc  = RSVG::Document.new
rect = RSVG::Rect.new :width => 100, :height => 50,
    :x => 150, :y => 150,
    :rx => 10, :ry => 10, :style => {
      :stroke => :black, 'stroke-width:' => '2pt',
      :fill => :green}
doc << rect

defrect = RSVG::Rect.new
doc << defrect

circ = RSVG::Circle.new :cx => 300, :cy => 300
doc << circ

ellipse = RSVG::Ellipse.new :cx => 300, :cy => 100
doc << ellipse

line = RSVG::Line.new :x1 => 50, :x2 => 250, :y1 => 20, :y2 => 100
doc << line

group = RSVG::Group.new :transform => "translate(200,150), rotate(45)"
group << RSVG::Rect.new
group << RSVG::Line.new(:x1 => 0, :y1 => 110, :x2 => 100, :y2 => 110)
doc << group

link = RSVG::Link.new :href => 'https://github.com/loz/rsvg'
link << RSVG::Rect.new(:x => 60, :y => 60)
doc << link

#Reuse1
grp = RSVG::Group.new :style => {:stroke => :blue, :fill => :none},
  :transform => "translate(400, 300)"
boval = RSVG::Ellipse.new  :id => :boval, :style => {}, :cx => 100, :cy => 100
grp1 = RSVG::Group.new :id => :grp1
grp1 << boval
3.times do |d|
  grp1 << RSVG::Use.new(:boval, :transform => "rotate(#{(d+1)*15}, 100, 100)")
end
grp << grp1
grp << RSVG::Use.new(:grp1, :transform => "rotate(45, 100, 100)")
grp << RSVG::Use.new(:grp1, :transform => "rotate(90, 100, 100)")
grp << RSVG::Use.new(:grp1, :transform => "rotate(135, 100, 100)")
doc << grp


grp = RSVG::Group.new :transform => "translate(350, 0)"
path = RSVG::Path.new 100, 100
path.line 200, 100
path.line 100, 110
path.move 200, 110
path.line 100, 120
path.line 200, 120
grp << path
doc << grp

cgrp = RSVG::Group.new :transform => "translate(100, 350)"
qgrp = RSVG::Group.new :transform => "translate(100, 460)"
sgrp = RSVG::Group.new :transform => "translate(100, 570)"
y = [0, 100]
cubic = RSVG::Path.new :id => :cubic
quadratic = RSVG::Path.new :id => :quadratic
points1 = RSVG::Path.new :style => {:stroke => :red, 'stroke-width' => '1pt', :fill => :none}
points2 = RSVG::Path.new :style => {:stroke => :red, 'stroke-width' => '1pt', :fill => :none}
points3 = RSVG::Path.new :style => {:stroke => :red, 'stroke-width' => '1pt', :fill => :none}
20.times do |x|
  cx, cy = x*10, y.first
  points1.line cx, cy
  points2.line cx, cy
  points3.line cx, cy
  cubic.cubic cx, cy
  quadratic.quadratic cx, cy
  y.rotate!
end
cgrp << points1
cgrp << cubic
qgrp << points2
qgrp << quadratic
sgrp << points3 #<< quadratic
doc << cgrp
doc << qgrp
doc << sgrp

grp = RSVG::Group.new :transform => 'translate(400, 150)'
path = RSVG::Path.new
(0..45).step(10) do |angle|
  path.move 0, 0
  path.arc 100, 50, 100, 75, :large => true, :rotation => angle
end
grp << path
doc << grp

puts doc.to_xml
