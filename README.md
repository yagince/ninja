# Ninja

the library behind the scenes

## Installation

Add this line to your application's Gemfile:

    gem 'ninja'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install ninja

## Usage

### Ninja::Hash

#### Usage

```ruby
require 'ninja/hash'

h = Ninja::Hash.new(hoge: 1, foo: 2)
h.hoge # => 1
h.foo # => 2
```

#### Other

```ruby
require 'ninja/hash'

h = {hoge: 1, foo: 2}.to_ninja_hash
h.hoge # => 1
h.foo # => 2

h_ninja = {hoge: 1, foo: 2}.ninja
h_ninja.hoge # => 1
h_ninja.foo # => 2
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
