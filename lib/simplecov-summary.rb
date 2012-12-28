require 'simplecov-summary/version'
require 'simplecov'

class SimpleCov::Formatter::SummaryFormatter
  def format(result)
    puts  "\n\n"
    print "SimpleCov stats:"

    name_length = result.groups.keys.map{|x| x.length}.max

    result.groups.each do |name, files|
      puts "\n"

      percentage = files.map{|x| x.covered_percent.round(2)}
      percentage = (percentage.sum / percentage.count).round(2)

      color = case percentage
      when 90..100
        :green
      when 80..90
        :yellow
      else
        :red
      end

      print "  #{name.rjust(name_length)}: #{percentage}".send(color)
    end
  end
end