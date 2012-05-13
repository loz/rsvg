require 'rexml/document'

module RSVG
  class Node
    attr_reader :attributes

    def initialize(*args)
      options = args.extract_options!
      @attributes = {}
      @attributes.merge! self.class.default_attributes if self.class.default_attributes
      @attributes.merge! options
    end

    class << self
      def node_type(t=nil)
        @node_type = t if t
        @node_type
      end

      def default_attributes(attrs=nil)
        @default_attributes = attrs if attrs
        @default_attributes
      end
    end

    def to_xml
      xml = REXML::Element.new self.class.node_type.to_s
      style = @attributes.delete :style
      if style
        xml.attributes['style'] = style.map {|k,v| "#{k}: #{v}"}.join("; ")
      end
      @attributes.each do |attr, value|
        xml.attributes[attr.to_s] = value
      end
      xml
    end
  end
end
