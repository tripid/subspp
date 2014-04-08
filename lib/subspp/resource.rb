module Subspp
  class Resource
    def self.define_attribute_method(method_name, mapping=nil)
      mapping ||= method_name.to_s
      mapping = mapping.gsub(/_/, '-')
      define_method(method_name) do
        node = doc.xpath("//#{mapping}")
        type = node.first.attributes["type"]

        result = node.text()
        if !type.nil? && type.text() == 'datetime'
          result = DateTime.parse(result)
        end
        result
      end
    end
  end
end
