module Tapbot
  class Client
    module Transactions        
      
      def transaction_list(options={})
        page = options[:page] || 1
        paginate = options[:paginate] || 50
        response = self.class.get("/transactions?paginate=#{paginate}&page=#{page}", headers: auth_headers("/transactions?paginate=#{paginate}&page=#{page}"))
        raise Tapbot::Error, response["errors"][0] unless response.success?
        response
      end  
      
      def transaction_details(id)
        response = self.class.get("/transactions/#{id}", headers: auth_headers("/transactions/#{id}"))
        raise Tapbot::Error, response["errors"][0] unless response.success?
        response
      end
      
      def create_transaction(to, amount, comments="")
        response = self.class.post("/transactions", { :body => {:transaction => { to: to, amount: amount, comments: comments }}.to_json, headers: auth_headers("/transactions", { :transaction => { to: to, amount: amount, comments: comments }}.to_json)})
        raise Tapbot::Error, response["errors"][0] unless response.success?
        response
      end
      
    end
  end
end