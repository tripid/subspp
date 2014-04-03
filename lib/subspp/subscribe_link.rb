module Subspp
  class SubscribeLink
    include Base

    attr_accessor :customer_id, :plan_id, :screen_name, :site

    def initialize(options)
      set_instance_variable_from_options(options)
    end

    def to_url
      "https://subs.pinpayments.com/#{site}/subscribers/#{customer_id}/subscribe/#{plan_id}/#{screen_name}"
    end
  end
end
