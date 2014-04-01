module Subspp
  class SubscribeLink
    attr_accessor :customer_id, :plan_id, :screen_name, :site

    def initialize(options)
      @site = options.fetch(:site)
      @customer_id = options.fetch(:customer_id)
      @plan_id = options.fetch(:plan_id)
      @screen_name = options.fetch(:screen_name)
    end

    def to_url
      "https://subs.pinpayments.com/#{site}/subscribers/#{customer_id}/subscribe/#{plan_id}/#{screen_name}"
    end
  end
end
