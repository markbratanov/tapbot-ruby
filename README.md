# Tapbot

[![Build Status](https://travis-ci.org/Tapbot/tapbot-ruby.svg?branch=master)](https://travis-ci.org/Tapbot/tapbot-ruby)
[![Code Climate](https://codeclimate.com/github/Tapbot/tapbot-ruby/badges/gpa.svg)](https://codeclimate.com/github/Tapbot/tapbot-ruby)

Official Tapbot API ruby gem.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tapbot'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tapbot

## Usage

###Client
First of all you should initialize a Tapbot client with your rest-token and secret.
```ruby
client = Tapbot.client(rest_token: "your-token-here", rest_secret: "your-secret-here")
```
###User profiles
```ruby
profile = client.profile("username")
```
Profile object
```ruby
profile.username => user username
profile.firstname => user first name
profile.lastname => user last name
profile.payment_address => user payment address
profile.bio => user bio 
```
###Me
```ruby
me = client.me
```
Me object:
```ruby
me.username => my username
me.firstname => user first name
me.lastname => user last name
me.payment_address => user payment address
me.bio => user bio 
me.email => my email
me.balance => my balance
```
###Prices
```ruby
price = client.price
```
Price object
```ruby
price.taps
price.btc
price.usd
```
###Transactions list
```ruby
transactions = client.transaction_list(paginate: 10, page: 5) # optional paginate and page options 
```
Transactions list object
```ruby
transactions.page
transactions.per_page
transactions.total_pages
transactions.total_transactions
transactions.transactions
```
###Transaction details
```ruby
transaction = client.transaction_details("transaction-id")
```
Transaction object
```ruby
transaction.transaction_id
transaction.from
transaction.to
transaction.amount
transaction.date
transaction.comments
```
###Create a Transaction
```ruby
transaction = client.create_transaction("username", amount) # transaction destination username
```
If everithing is ok it should return a Transaction object
```ruby
transaction.transaction_id
transaction.from
transaction.to
transaction.amount
transaction.date
transaction.comments
```
Otherwise it should raise a Tapbot::Error with a concrete message
###Exchange details
```ruby
exchange = client.exchange_details("exchange-id")
```
Exchange object
```ruby
exchange.exchange_id
exchange.btc_address
exchange.status
exchange.from
exchange.to
exchange.from_amount
exchange.to_amount
exchange.date
```
###Create an Exchange
```ruby
exchange = client.create_exchange(amount, "btc-address") # TAP amount to exchange to BTC and your Wallet address
```
If everithing is ok it should return a Exchange object
```ruby
exchange.exchange_id
exchange.btc_address
exchange.status
exchange.from
exchange.to
exchange.from_amount
exchange.to_amount
exchange.date
```
Otherwise it should raise a Tapbot::Error with a concrete message

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tapbot/tapbot-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

