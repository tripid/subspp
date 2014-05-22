module Subspp
  class Resource
    def self.define_attribute_method(method_name, mapping=nil)
      mapping ||= method_name.to_s
      mapping = mapping.gsub(/_/, '-')
      define_method(method_name) do
        unless doc.nil?
          node = doc.xpath("//#{mapping}")
          type = node.first.attributes["type"] || 'text'
          send("to_#{type}", node.text)
        end
      end
    end

    private

    def to_text(value)
      value.to_s
    end

    def to_datetime(value)
      return DateTime.new(0) if value === '' || value .nil?
      DateTime.parse(value)
    end

    def to_boolean(value)
      value === 'true'
    end

    def to_decimal(value)
      value.to_f
    end
  end
end
