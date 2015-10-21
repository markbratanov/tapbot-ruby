module Tapbot
  class Client
    module Users
    
      def profile(username)
        response = self.class.get("/users/#{username}")
        raise Tapbot::Error, response["errors"][0] unless response.success?
        response
      end
  
      def me
        response = self.class.get("/users/me", headers: auth_headers("/users/me"))
        raise Tapbot::Error, response["errors"][0] unless response.success?
        response
      end
    end
  end
end