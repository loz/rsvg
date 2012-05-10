
module RSVG
  class Document < ParentNode
    node_type :svg

    def to_xml
      xml = super
      xml.add_namespace("http://www.w3.org/2000/svg")
      xml
    end
  end
end
