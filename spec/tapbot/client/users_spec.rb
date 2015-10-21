require File.expand_path('../../../spec_helper', __FILE__)


describe Tapbot::Client::Users do
  
  describe "Users profile" do
    
    it "should be able to call to obtain any user profile" do
      client = Tapbot::Client.new(rest_token: "rest-token", rest_secret: 'rest-secret')
      stub_request(:get, Tapbot::Configuration::BASE_URI + "/users/username").to_return(:body => fixture("profile.json"), :headers => {"Content-Type"=> "application/json"})
      
      profile = client.profile("username")
      expect(a_request(:get, Tapbot::Configuration::BASE_URI + "/users/username")).to have_been_made.times(1)
      
      expect(profile.username).to eq("davidrv")
      expect(profile.firstname).to eq("david")
      expect(profile.lastname).to eq("ramirez")
    end
    
    it "should return a Tapbot::Error with message and error is returned from Tapbot api" do
      client = Tapbot::Client.new(rest_token: "rest-token", rest_secret: 'rest-secret')
      stub_request(:get, Tapbot::Configuration::BASE_URI + "/users/wrong").to_return(status: 401, body: fixture("error.json"), :headers => {"Content-Type"=> "application/json"})      
      expect { profile = client.profile("wrong") }.to raise_error(Tapbot::Error)
    end
    
  end
  
  describe "Me" do
    
    it "should be able to call to obtain my complete profile info" do
      client = Tapbot::Client.new(rest_token: "rest-token", rest_secret: 'rest-secret')
      stub_request(:get, Tapbot::Configuration::BASE_URI + "/users/me").to_return(:body => fixture("me.json"), :headers => {"Content-Type"=> "application/json"})

      me = client.me
      expect(a_request(:get, Tapbot::Configuration::BASE_URI + "/users/me")).to have_been_made.times(1)      
      
      expect(me.username).to eq("davidrv")
      expect(me.email).to eq("david@davidrv.com")
      expect(me.balance).to eq(100)
    end
    
    it "should not be able to call to obtain my complete profile info without credentials" do
      client = Tapbot::Client.new()
      stub_request(:get, Tapbot::Configuration::BASE_URI + "/users/me").to_return(:body => fixture("error.json"), :headers => {"Content-Type"=> "application/json"})
                  
      expect { me = client.me }.to raise_error(Tapbot::Error)
    end
  
  end
  
end