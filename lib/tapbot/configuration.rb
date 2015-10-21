require File.expand_path('../version', __FILE__)

module Tapbot
  module Configuration    
    VALID_OPTIONS_KEYS = [:rest_token, :rest_secret].freeze
    BASE_URI = 'https://api.tapbot.com/v1'.freeze
    USER_AGENT = "tapbot-ruby #{Tapbot::VERSION}".freeze
    API_VERSION = "v1"
    
    attr_accessor *VALID_OPTIONS_KEYS
    
    def configure
      yield self
    end
    
    def options
      VALID_OPTIONS_KEYS.inject({}) do |option, key|
        option.merge!(key => send(key))
      end
    end
    
  end
end