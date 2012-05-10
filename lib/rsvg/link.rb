module RSVG
  class Link < ParentNode
    node_type :a
    default_attributes :target => '_top'

    def to_xml
      xml = super
      xml.attributes.delete 'href'
      xml.attributes['xlink:href'] = @attributes[:href]
      xml
    end
  end
end
