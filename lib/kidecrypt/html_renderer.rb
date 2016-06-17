require 'erb'

module Kidecrypt
  class HtmlRenderer
    def initialize
    end

    def output body_message
      template = self.class.template_contents
      result = ERB.new(template).result(binding)
      puts result
    end

    def self.template_contents
      File.read(File.join(File.dirname(__FILE__), '..', '..', 'views', 'page.html.erb'))
    end
  end
end
