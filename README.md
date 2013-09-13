# Ninja

the library behind the scenes

## Installation

Add this line to your application's Gemfile:

    gem 'ninja', github: "myfoot/ninja"

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install specific_install
    $ gem specific_install -l 'git://github.com/myfoot/ninja.git'

## Usage

### Ninja::Hash

```ruby
require 'ninja/hash'

h = Ninja::Hash.new(hoge: 1, foo: 2)
h.hoge # => 1
h.foo  # => 2
h.piyo # => nil

h = {hoge: 1, foo: 2}.to_ninja_hash
h.hoge # => 1
h.foo  # => 2

h_ninja = {hoge: 1, foo: 2}.ninja
h_ninja.hoge # => 1
h_ninja.foo  # => 2

h = {hoge: 1, foo: { bar: 2 }}.ninja
h.foo.bar # => 2

# default value
h.get(:piyo) { 1 + 2 } # => 3
h.get(:piyo)           # => nil
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
