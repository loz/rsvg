require 'rsvg'

doc  = RSVG::Document.new
rect = RSVG::Rect.new :width => 100, :height => 50,
    :x => 150, :y => 150,
    :rx => 10, :ry => 10, :style => {
      :stroke => :black, 'stroke-width:' => '2pt',
      :fill => :green}

circ = RSVG::Circle.new :cx => 300, :cy => 300
ellipse = RSVG::Ellipse.new :cx => 300, :cy => 100

defrect = RSVG::Rect.new
doc << rect
doc << defrect
doc << circ
doc << ellipse
puts doc.to_xml
