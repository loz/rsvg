require 'rsvg'

doc  = RSVG::Document.new
rect = RSVG::Rect.new :width => 100, :height => 50,
    :x => 150, :y => 150,
    :rx => 10, :ry => 10, :style => {
      :stroke => :black, 'stroke-width:' => '2pt',
      :fill => :green}
defrect = RSVG::Rect.new
circ = RSVG::Circle.new :cx => 300, :cy => 300
ellipse = RSVG::Ellipse.new :cx => 300, :cy => 100
line = RSVG::Line.new :x1 => 50, :x2 => 250, :y1 => 20, :y2 => 100

group = RSVG::Group.new :transform => "translate(200,150), rotate(45)"
group << RSVG::Rect.new
group << RSVG::Line.new(:x1 => 0, :y1 => 110, :x2 => 100, :y2 => 110)

link = RSVG::Link.new :href => 'https://github.com/loz/rsvg'
link << RSVG::Rect.new(:x => 60, :y => 60)

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

doc << rect
doc << defrect
doc << circ
doc << ellipse
doc << line
doc << group
doc << link

puts doc.to_xml
