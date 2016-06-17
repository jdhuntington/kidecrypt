module Kidecrypt
  class Shift1
    def initialize message
      @message = message
      @ciphertext = shift1(message)
    end

    def render(renderer)
      renderer.output(@ciphertext)
    end

    def shift1 message
      message.tr("a-z", "b-za")
    end
  end
end
