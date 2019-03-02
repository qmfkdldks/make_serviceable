# MakeServiceable

This gem will help you implement circuit breaker pattern to all services objects. Any unstable API should be protected by circuit breaker pattern. When API call fails so frequently, circuit will be opened and will skip the method directly to fail fast and get more resilient behaviour. After few seconds it will close circuit so method get called normaly.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'make_serviceable'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install make_serviceable

## Usage

Following command will create new service object under app/services folder.

```
$ bundle exec make_serviceable generate TestService
```
This is how service object looks like.

```ruby
class TestService
  include MakeServiceable

  # Pass ncessary parameters and then use it in #call
  def initialize()
  end

  # Set service name (optional). Default is class name
  # def service_name
  # end

  # Chage circuit behaviour here. Read documentation of circuitbox
  # def circuit_option
  # {}
  # end

  def call
    # Call any API call here. All failures are captured by circuit and it will be protected by circuit breaker pattern.
  end
end
```
And you can call 
```ruby
TestService.call()
```

## Development


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/make_serviceable. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the MakeServiceable project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/make_serviceable/blob/master/CODE_OF_CONDUCT.md).
