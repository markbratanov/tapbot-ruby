require File.expand_path('../../../spec_helper', __FILE__)


describe Tapbot::Client::Exchanges do
    
  describe "Exchange details" do
    it "should be able to call to obtain details with exchange id" do
      client = Tapbot::Client.new(rest_token: "rest-token", rest_secret: 'rest-secret')
      
      stub_request(:get, Tapbot::Configuration::BASE_URI + "/exchanges/id").to_return(:body => fixture("exchange.json"), :headers => {"Content-Type"=> "application/json"})      
      
      exchange = client.exchange_details("id")
      expect(a_request(:get, Tapbot::Configuration::BASE_URI + "/exchanges/id")).to have_been_made.times(1)
      
      expect(exchange.from_amount).to eq(10)
      expect(exchange.btc_address).to eq("btc-address")
    end    
  end
  
  describe "Create an exchange" do
    it "should be able to POST to /exchanges and create an exchange" do
      client = Tapbot::Client.new(rest_token: "rest-token", rest_secret: 'rest-secret')
      
      stub_request(:post, Tapbot::Configuration::BASE_URI + "/exchanges").to_return(:body => fixture("exchange.json"), :headers => {"Content-Type"=> "application/json"})      
      
      exchange = client.create_exchange("davidrv", 10)
      expect(a_request(:post, Tapbot::Configuration::BASE_URI + "/exchanges")).to have_been_made.times(1)
      
      expect(exchange.from_amount).to eq(10)
      expect(exchange.btc_address).to eq("btc-address")
    end    
  end
  
end