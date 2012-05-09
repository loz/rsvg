require 'rsvg'

doc  = RSVG::Document.new
rect = RSVG::Rect.new :width => 100, :height => 50,
    :x => 10, :y => 10,
    :rx => 10, :ry => 10, :style => "stroke: black; stroke-width: 2pt; fill: green"
doc << rect
puts doc.to_xml
