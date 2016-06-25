module Kidecrypt
  class Command
    def initialize(args)
      @args = args
    end

    def run
      send(@args[0], *@args[1 .. -1])
    end

    def shift1(msg)
      Shift1.new(msg).render(renderer)
    end

    def frequency(msg)
      Frequency.new(msg).render(renderer)
    end

    def number_replacement(msg)
      NumberReplacement.new(msg).render(renderer)
    end

    def renderer
      HtmlRenderer.new
    end
  end
end
