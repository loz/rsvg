module RSVG
  class Ellipse < Node
    node_type :ellipse
    default_attributes :rx => 100, :ry => 50,
      :style => {'stroke-width' => '2pt', :fill => '#dddddd', :stroke => :black}
  end
end
