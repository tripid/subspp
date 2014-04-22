module Subspp
  class Configuration
    attr_writer :host, :api_version
    attr_accessor :token, :site, :plan_ids

    def host
      @host || 'https://subs.pinpayments.com'
    end

    def api_version
      @api_version || 'v4'
    end
  end
end
