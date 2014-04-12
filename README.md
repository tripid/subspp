# Subspp

Ruby client for Pinpayments Subscription API

## Installation

Add this line to your application's Gemfile:

    gem 'subspp'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install subspp


## Usage

### Configuration

```ruby
Subspp.configure do |config|
  config.site   = ENV['SUBSPP_SITE']
  config.token  = ENV['SUBSPP_TOKEN']
end
```

### Subscriber

Get subscriber's information

```ruby
subscriber = Subspp::Subscriber.load(customer_id: 1)
```

## Contributing

1. Fork it ( http://github.com/tripid/subspp/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
