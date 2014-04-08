require 'net/http'
require 'openssl'
require 'nokogiri'

module Subspp
  autoload :Base,           'subspp/base'
  autoload :Resource,       'subspp/resource'
  autoload :Configuration,  'subspp/configuration'
  autoload :SubscribeLink,  'subspp/subscribe_link'
  autoload :Subscriber,     'subspp/subscriber'

  class << self
    def configure
      yield(configuration)
    end

    def configuration
      @configuration ||= Configuration.new
    end
  end
end
