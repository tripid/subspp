require 'ostruct'
module Subspp
  class Configuration < OpenStruct
    attr_writer :host, :api_version, :plan_ids
    attr_accessor :token, :site

    def host
      @host || 'https://subs.pinpayments.com'
    end

    def api_version
      @api_version || 'v4'
    end

    def plan_ids
      @plan_ids || {}
    end
  end
end
