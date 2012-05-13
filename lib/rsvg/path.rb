module RSVG
  class Path < Node
    node_type :path

    default_attributes :style => {
        'stroke-width' => "2pt",
        :stroke => :black,
        :fill => :none
      }

    def initialize(*args)
      super(*args)
      @actions = []
      options = args.extract_options!
      x = args[0] || 0
      y = args[1] || 0
      move x, y
    end

    def move(x,y, options = {})
      @actions << {:instruction => :M, :points => [x,y], :options => options}
    end

    def line(x,y, options = {})
      @actions << {:instruction => :L, :points => [x,y], :options => options}
    end

    def cubic(x,y, options = {})
      @actions << {:instruction => :C, :points => [x,y], :options => options}
    end

    def quadratic(x,y, options = {})
      @actions << {:instruction => :Q, :points => [x,y], :options => options}
    end

    def to_xml
      xml = super
      xml.add_attribute 'd', build_actions
      xml
    end

    private

    def build_actions
      last = nil
      @actions.map do |a|
        instruction = a[:instruction].to_s
        instruction.downcase! if a[:options][:relative]
        points = a[:points].join ' '
        if last == instruction
          points
        else
          last = instruction
          "%s%s" % [instruction, points]
        end
      end.join ' '
    end
  end
end
