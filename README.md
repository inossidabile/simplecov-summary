# Simplecov::Summary

SimpleCov formatter that prints nice colored summary for your coverage straight into your console.

![](http://f.cl.ly/items/102M0n1q3P3E3h3Y3z3m/Снимок%20экрана%202012-12-29%20в%204.29.15.png)

[![endorse](http://api.coderwall.com/inossidabile/endorsecount.png)](http://coderwall.com/inossidabile)

## Installation

Add this line to your application's Gemfile:

    gem 'simplecov-summary'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simplecov-summary

## Example

Below you can find the example for a typical Rails RSpec configuration. The following setup will silently generate HTML output and show you colored summary on each run.

```ruby
  require 'simplecov'

  SimpleCov.start do
    add_filter '/spec/'
    add_filter '/config/'
    add_filter '/db/'
    add_filter '/vendor/'

    add_group 'Controllers', 'app/controllers'
    add_group 'Models', 'app/models'
    add_group 'Decorators', 'app/decorators'
    add_group 'Helpers', 'app/helpers'
    add_group 'Libraries', 'lib'

    at_exit do
    end
  end

  RSpec.configure do |config|
    config.after(:suite) do
      if SimpleCov.running
        silence_stream(STDOUT) do
          SimpleCov::Formatter::HTMLFormatter.new.format(SimpleCov.result)
        end

        SimpleCov::Formatter::SummaryFormatter.new.format(SimpleCov.result)
      end
    end
  end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
