module Kidecrypt; end

Dir[File.join(File.dirname(__FILE__), 'kidecrypt', '*.rb')].each do |f|
  require File.expand_path(f)
end
