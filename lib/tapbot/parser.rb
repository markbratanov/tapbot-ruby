module Tapbot
  class Parser < HTTParty::Parser
    SupportedFormats = {'application/json' => :json}
    
    def initialize(body, format)
      @body = body
      @format = format
    end

    def json
      Hashie::Mash.new(JSON.parse(body))
    end
    
  end
end