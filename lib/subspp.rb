require 'net/http'
require 'openssl'
require 'ostruct'
require 'nokogiri'

require "subspp/base"
require "subspp/configuration"
require "subspp/subscribe_link"
require "subspp/subscriber"
require "subspp/version"

module Subspp
  class << self
    def configure
      yield(configuration)
    end

    def configuration
      @configuration ||= Configuration.new
    end
  end
end
