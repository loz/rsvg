module RSVG
  class Node
    attr_reader :attributes

    def initialize(options = {})
      @attributes = options
    end

    class << self
      def node_type(t=nil)
        @node_type = t if t
        @node_type
      end
    end

    def to_xml
      xml = REXML::Element.new self.class.node_type.to_s
      @attributes.each do |attr, value|
        xml.attributes[attr.to_s] = value
      end
      xml
    end
  end
end
