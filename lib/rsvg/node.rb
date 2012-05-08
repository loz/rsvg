module RSVG
  class Node
    class << self
      def node_type(t=nil)
        @node_type = t if t
        @node_type
      end
    end

    def to_xml
      xml = REXML::Element.new self.class.node_type.to_s
    end
  end
end
