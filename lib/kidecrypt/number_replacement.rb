module Kidecrypt
  class NumberReplacement
    def initialize msg
      @msg = msg
    end

    def render renderer
      renderer.output ciphertext
    end

    def ciphertext
      @msg.downcase.gsub(/[a-z]/) { |x| x[0].chr }
    end
  end
end
