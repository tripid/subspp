module Subspp
  module Base
    def set_instance_variable_from_options(options)
      options.each do |key, value|
        instance_variable_set "@#{key}", value
      end
    end
  end
end
