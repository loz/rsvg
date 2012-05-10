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


doc << rect
doc << defrect
doc << circ
doc << ellipse
doc << line
doc << group
puts doc.to_xml
