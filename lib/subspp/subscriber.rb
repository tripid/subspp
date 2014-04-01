module Subspp
  class Subscriber
    def self.define_attribute_method(method_name, mapping=nil)
      mapping ||= method_name
      define_method(method_name) do
        node = doc.xpath("//#{mapping}")
        type = node.first.attributes["type"]

        result = doc.xpath("//#{mapping}").text()
        if !type.nil? && type.text() == 'datetime'
          result = DateTime.parse(result)
        end
        result
      end
    end

    attr_accessor :token, :site, :customer_id, :doc

    define_attribute_method :first_name, 'billing-first-name'
    define_attribute_method :last_name, 'billing-last-name'
    define_attribute_method :email
    define_attribute_method :active_until, 'active-until'

    def initialize(options)
      @token = options.fetch(:token)
      @site = options.fetch(:site)
      @customer_id = options.fetch(:customer_id)
    end

    def url
      "https://subs.pinpayments.com/api/v4/#{site}/subscribers/#{customer_id}.xml"
    end

    def retrieve
      uri = URI(url)
      Net::HTTP.start(uri.host, uri.port.to_s,
                                 use_ssl: true,
                                 verify_mode: OpenSSL::SSL::VERIFY_NONE) do |http|
        req = Net::HTTP::Get.new(uri.request_uri)
        req.basic_auth(token, 'X')
        http.request(req)
      end
    end

    def self.load(options)
      subscriber = new(options).tap do |s|
        xml = s.retrieve
        s.doc = Nokogiri::XML(xml)
      end
    end
  end
end
