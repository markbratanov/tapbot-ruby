require File.expand_path('../../../spec_helper', __FILE__)


describe Tapbot::Client::Transactions do
  
  describe "Transactions list" do
    
    it "should be able to obtain a paginated list of user transactions" do
      client = Tapbot::Client.new(rest_token: "rest-token", rest_secret: 'rest-secret')
      stub_request(:get, Tapbot::Configuration::BASE_URI + "/transactions?page=1&paginate=50").to_return(:body => fixture("transactions.json"), :headers => {"Content-Type"=> "application/json"})
                  
      transactions = client.transaction_list
      expect(a_request(:get, Tapbot::Configuration::BASE_URI + "/transactions?page=1&paginate=50")).to have_been_made.times(1)
      
      expect(transactions.total_transactions).to eq(10)
      expect(transactions.total_pages).to eq(1)
      expect(transactions.page).to eq(1)
      expect(transactions.per_page).to eq(50)
      expect(transactions.transactions.count).to eq(10)
    end
    
    it "should accept the paginate option" do      
      client = Tapbot::Client.new(rest_token: "rest-token", rest_secret: 'rest-secret')
      stub_request(:get, Tapbot::Configuration::BASE_URI + "/transactions?page=1&paginate=20").to_return(:body => fixture("transactions.json"), :headers => {"Content-Type"=> "application/json"})
      transactions = client.transaction_list(paginate: 20)
      expect(a_request(:get, Tapbot::Configuration::BASE_URI + "/transactions?page=1&paginate=20")).to have_been_made.times(1)      
    end
    
    it "should accept the page option" do      
      client = Tapbot::Client.new(rest_token: "rest-token", rest_secret: 'rest-secret')
      stub_request(:get, Tapbot::Configuration::BASE_URI + "/transactions?page=5&paginate=20").to_return(:body => fixture("transactions.json"), :headers => {"Content-Type"=> "application/json"})
      transactions = client.transaction_list(paginate: 20, page: 5)
      expect(a_request(:get, Tapbot::Configuration::BASE_URI + "/transactions?page=5&paginate=20")).to have_been_made.times(1)
    end
    
  end
  
  describe "Transaction details" do
    it "should be able to call to obtain details with transaction id" do
      client = Tapbot::Client.new(rest_token: "rest-token", rest_secret: 'rest-secret')
      
      stub_request(:get, Tapbot::Configuration::BASE_URI + "/transactions/id").to_return(:body => fixture("transaction.json"), :headers => {"Content-Type"=> "application/json"})      
      
      transaction = client.transaction_details("id")
      expect(a_request(:get, Tapbot::Configuration::BASE_URI + "/transactions/id")).to have_been_made.times(1)
      
      expect(transaction.from).to eq("davidrv")
      expect(transaction.to).to eq("victor")
    end    
  end
  
  describe "Create a transaction" do
    it "should be able to post /transactions and create a transaction" do
      client = Tapbot::Client.new(rest_token: "rest-token", rest_secret: 'rest-secret')
      
      stub_request(:post, Tapbot::Configuration::BASE_URI + "/transactions").to_return(:body => fixture("transaction.json"), :headers => {"Content-Type"=> "application/json"})      
      
      transaction = client.create_transaction("davidrv", 10)
      expect(a_request(:post, Tapbot::Configuration::BASE_URI + "/transactions")).to have_been_made.times(1)
      
      expect(transaction.from).to eq("davidrv")
      expect(transaction.to).to eq("victor")
    end    
  end
  
end