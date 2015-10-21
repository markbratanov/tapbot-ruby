module Tapbot
  class Client
    module Exchanges
      
      def exchange_details(id)
        response = self.class.get("/exchanges/#{id}", headers: auth_headers("/exchanges/#{id}"))
        raise Tapbot::Error, response["errors"][0] unless response.success?
        response
      end
      
      def create_exchange(amount, address)
        response = self.class.post("/exchanges", { :body => {:exchange => { from_amount: amount, btc_address: address }}.to_json, headers: auth_headers("/exchanges", { :exchange => { from_amount: amount, btc_address: address }}.to_json)})
        raise Tapbot::Error, response["errors"][0] unless response.success?
        response
      end
      
    end
  end
end