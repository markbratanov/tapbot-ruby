module Tapbot
  class Client
    module Prices  
        
      def price
        response = self.class.get("/price", headers: auth_headers("/price"))
        raise Tapbot::Error, response["errors"][0] unless response.success?
        response
      end  
      
    end
  end
end