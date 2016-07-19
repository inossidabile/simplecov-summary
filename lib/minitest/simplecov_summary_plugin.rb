module Minitest
  def self.plugin_simplecov_summary_init(options)
    require 'simplecov-summary'

    at_exit do
      if SimpleCov.running
        SimpleCov::Formatter::SummaryFormatter.new.format(SimpleCov.result)
      end
    end
  end
end