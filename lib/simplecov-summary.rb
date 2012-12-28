require 'simplecov-summary/version'
require 'simplecov'

class SimpleCov::Formatter::SummaryFormatter
  def format(result)
    puts "\n\n"
    puts "SimpleCov stats:"

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

      puts "  #{name.rjust(name_length)}: #{percentage}%".send(color)
    end

    print "  #{'Total'.rjust(name_length)}: #{result.covered_percent.round(2)}%"
  end
end