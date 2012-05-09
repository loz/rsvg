require 'rexml/document'

module RSVG
  class Rect < Node
    node_type :rect
    default_attributes :width => 100, :height => 100,
      :style => {'stroke-width' => '2pt', :fill => '#dddddd', :stroke => :black}
  end
end
