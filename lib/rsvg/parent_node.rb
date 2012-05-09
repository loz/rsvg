module RSVG
  class ParentNode < Node
    attr_reader :children

    def initialize(*args)
      @children = []
      super(*args)
    end

    def <<(child)
      @children << child
    end

    def to_xml
      xml =super
      @children.each do |child|
        xml.add_element child.to_xml
      end
      xml
    end
  end
end
