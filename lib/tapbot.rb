require 'httparty'
require 'hashie'
require "tapbot/version"
require "tapbot/error"
require "tapbot/configuration"
require "tapbot/api"
require "tapbot/parser"
require "tapbot/client"

module Tapbot
  extend Configuration
  
  def self.client(options={})
    Tapbot::Client.new(options)
  end
  
end
