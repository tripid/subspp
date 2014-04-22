module Subspp
  class SubscribeLink
    include Base

    attr_accessor :customer_id, :plan_id, :screen_name, :configuration

    def initialize(options)
      set_instance_variable_from_options(options)
      @configuration = Subspp.configuration
    end

    def site
      @site || @configuration.site
    end

    def to_url
      [ configuration.host, site, 'subscribers', customer_id,
        'subscribe', plan_id, screen_name  ].join('/')
    end
  end
end
