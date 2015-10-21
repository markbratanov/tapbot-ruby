module Tapbot
  class Client < Api
    Dir[File.expand_path('../client/*.rb', __FILE__)].each{|f| require f}
  
    include HTTParty
    
    parser Tapbot::Parser
    
    base_uri Tapbot::Configuration::BASE_URI
          
    def auth_headers(url, body="")
        ts = Time.now.to_i.to_s
        if rest_secret && rest_token && url
          signature = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'),
                                              rest_secret,
                                              rest_token + ts + (Tapbot::Configuration::BASE_URI + url) + body.to_s)
              
                                            
          { 
            "Content-Type" => "application/json", 
            "Accept" => "application/json",
            "User-Agent" => Tapbot::Configuration::USER_AGENT,
            'TP-REST-TOKEN' => rest_token,
            'TP-ACCESS-SIGNATURE' => signature,
            'TP-ACCESS-TIMESTAMP' => ts,
            'TP-API-VERSION' => Tapbot::Configuration::API_VERSION }
        else
          raise Tapbot::Error, "Invalid credentials"
        end
    end
   
    include Tapbot::Client::Users
    include Tapbot::Client::Prices
    include Tapbot::Client::Transactions
    include Tapbot::Client::Exchanges
  end
end