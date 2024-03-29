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

    def curve(x,y, options = {})
      @actions << {:instruction => :S, :points => [x,y], :options => options}
    end

    def bezier(x,y, options = {})
      @actions << {:instruction => :T, :points => [x,y], :options => options}
    end

    def arc(rx, ry, tox, toy, options = {})
      large = options.delete(:large) ? 1 : 0
      invert = options.delete(:invert) ? 1 : 0
      rotation = options.delete(:rotation) || 0
      command = {
        :instruction => :A,
        :points =>[rx, ry, rotation, large, invert, tox, toy],
        :options => options
      }
      @actions << command
    end

    def to_xml
      xml = super
      xml.add_attribute 'd', build_actions
      xml
    end

    private

    def build_actions
      last = nil
      condensed = [?Q, ?C, ?S, ?T]
      @actions.map do |a|
        instruction = a[:instruction].to_s
        instruction.downcase! if a[:options][:relative]
        points = a[:points].join ' '
        if instruction == last && condensed.include?(instruction)
          points
        else
          last = instruction
          "%s%s" % [instruction, points]
        end
      end.join ' '
    end
  end
end
