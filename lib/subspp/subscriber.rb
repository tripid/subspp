require 'forwardable'
module Subspp
  class Subscriber < Resource
    extend Forwardable
    include Base

    attr_accessor :site, :customer_id, :doc, :configuration

    define_attribute_method :first_name, 'billing-first-name'
    define_attribute_method :last_name, 'billing-last-name'
    define_attribute_method :email
    define_attribute_method :active_until
    define_attribute_method :expired_at
    define_attribute_method :recurring
    define_attribute_method :store_credit
    define_attribute_method :grace_until
    define_attribute_method :customer_id
    define_attribute_method :subscription_plan_name
    define_attribute_method :created_at
    define_attribute_method :updated_at

    delegate [:host, :api_version, :site, :token] => :configuration

    def initialize(options)
      set_instance_variable_from_options(options)
      @configuration = Subspp.configuration
    end

    def url
      [ host, 'api',  api_version, site, 'subscribers', "#{customer_id}.xml" ].
        join('/')
    end

    def subscribed?
      grace_until > Time.now
    end

    def retrieve
      uri = URI(url)
      Net::HTTP.start(uri.host, uri.port.to_s,
                      use_ssl: true, verify_mode: OpenSSL::SSL::VERIFY_NONE) do |http|
        req = Net::HTTP::Get.new(uri.request_uri)
        req.basic_auth(token, 'X')
        response = http.request(req)
      end
    end

    def self.load(options)
      subscriber = new(options).tap do |s|
        response = s.retrieve
        s.doc = Nokogiri::XML(response.body)
      end
    end
  end
end
