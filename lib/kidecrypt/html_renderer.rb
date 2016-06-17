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

    def output_with_key msg, key
      template = self.class.template_contents 'page-with-key'
      result = ERB.new(template).result(binding)
      puts result
    end

    def self.template_contents name='page'
      File.read(File.join(File.dirname(__FILE__), '..', '..', 'views', "#{name}.html.erb"))
    end
  end
end
