module RSVG
  class Use < Node
    node_type :use

    def initialize(targetid, *args)
      super(*args)
      @targetid = targetid
    end

    def to_xml
      xml = super
      xml.attributes['xlink:href'] = '#' + @targetid.to_s
      xml
    end
  end
end
