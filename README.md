**Please note, this gem is no longer maintained**

# Resque Coalmine

Resque failure backend that sends exceptions to [coalmineapp.com](http://coalmineapp.com).

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

If you are already using coalmineapp.com gem, you just need

    Resque::Failure.backend = Resque::Failure::Coalmine

If you've not yet configured Coalmine in your project, visit the project page for installation instructions.

## Notes

In development mode you need to configure Coalmine to send exceptions, default is `['production', 'staging']`

    Coalmine.configure do |config|
        ....
        config.enabled_environments += %w( development ) if Rails.env.development?
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
