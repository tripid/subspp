require 'open-uri'
module Subspp
  class SubscribeLink
    include Base

    attr_accessor :customer_id, :plan_id, :configuration

    def initialize(options)
      set_instance_variable_from_options(options)
      @configuration = Subspp.configuration
    end

    def site
      @site || @configuration.site
    end

    def screen_name
      URI.encode(@screen_name.downcase.gsub(/ /, '-'))
    end

    def to_url
      [ configuration.host, site, 'subscribers', customer_id,
        'subscribe', plan_id, screen_name  ].join('/')
    end
  end
end
