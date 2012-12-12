# ResqueCoalmine

Sends exceptions from resque to coalmineapp.com

## Installation

Add this line to your application's Gemfile:

    gem 'resque_coalmine'

And then execute:

   $ bundle

Or install it yourself as:

    $ gem install resque_coalmine

## Usage

    Resque::Failure::Coalmine.configure do |config|
      config.signature = 'my_secret_signature'
    end

    Resque::Failure.backend = Resque::Failure::Coalmine

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
