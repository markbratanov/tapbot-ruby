require File.expand_path('../../../spec_helper', __FILE__)


describe Tapbot::Client::Prices do
  
  describe "Obtain TAP price" do
    
    it "should be able to obtain TAP price" do
      client = Tapbot::Client.new(rest_token: "rest-token", rest_secret: 'rest-secret')
      stub_request(:get, Tapbot::Configuration::BASE_URI + "/price").to_return(:body => fixture("price.json"), :headers => {"Content-Type"=> "application/json"})
                  
      price = client.price
      expect(a_request(:get, Tapbot::Configuration::BASE_URI + "/price")).to have_been_made.times(1)
      
      expect(price.usd).to eq(0.0100)
      expect(price.taps).to eq(1)
      expect(price.btc).to eq(0.00004226)
    end
    
  end
end