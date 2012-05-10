module RSVG
  class Line < Node
    node_type :line
    default_attributes :style => {'stroke-width' => '2pt', :stroke => :black}
  end
end
