require 'simplecov-summary/version'
require 'simplecov'
require 'colorize'

class SimpleCov::Formatter::SummaryFormatter
  def initialize(output = nil)
    @output = output || STDOUT
  end

  def format(result)
    @output.puts "SimpleCov stats:"

    name_length = (result.groups.keys + ["Total"]).map{|x| x.length}.max

    result.groups.each do |name, files|
      percentage = files.covered_percent.round(2)

      color = case percentage
      when 90..100
        :green
      when 80..90
        :yellow
      else
        :red
      end

      @output.puts "  #{name.rjust(name_length)}: #{percentage}%".colorize(color)
    end

    @output.puts "  #{'Total'.rjust(name_length)}: #{result.covered_percent.round(2)}%"
  end
end
