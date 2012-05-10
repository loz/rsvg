module RSVG
  class Circle < Node
    node_type :circle
    default_attributes :r => 100,
      :style => {'stroke-width' => '2pt', :fill => '#dddddd', :stroke => :black}
  end
end
