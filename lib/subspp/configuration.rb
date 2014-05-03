require 'ostruct'
module Subspp
  class Configuration
    attr_accessor :host, :api_version, :plan_ids, :token, :site

    def initialize(options={})
      @host         = options.fetch(:host, 'https://subs.pinpayments.com')
      @api_version  = options.fetch(:api_version, 'v4')
      @plan_ids     = options.fetch(:plan_ids, {})
    end
  end
end
