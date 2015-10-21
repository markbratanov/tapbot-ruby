require 'spec_helper'

describe Tapbot do
  it 'has a version number' do
    expect(Tapbot::VERSION).not_to be nil
  end
  
  describe "CLIENT" do
    it "should be a Tapbot::Client" do
      expect(Tapbot.client).to be_a Tapbot::Client
    end
  end
  
  describe "BASE URI" do
    it "should return the default base uri" do
      expect(Tapbot::Configuration::BASE_URI).to eq("https://api.tapbot.com/v1")
    end
  end
  
  describe "API VERSION" do
    it "should return the default API version" do
      expect(Tapbot::Configuration::API_VERSION).to eq("v1")
    end
  end
  
  describe "User Agent" do
    it "should return the default API version" do
      expect(Tapbot::Configuration::USER_AGENT).to eq("tapbot-ruby #{Tapbot::VERSION}")
    end
  end
  
  describe "Configuration" do
    Tapbot::Configuration::VALID_OPTIONS_KEYS.each do |key|
      it "should set the #{key}" do
        Tapbot.configure do |config|
          config.send("#{key}=", key)
          expect(Tapbot.send(key)).to eq(key)
        end
      end
    end
  end
  
end
