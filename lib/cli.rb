require 'optparse'
require 'ostruct'

module Abscss
  class CLI
    def self.execute(stdout, arguments=[])

      if ARGV.size < 1
        $stderr.puts "Usage: abscss files_or_urls"
        exit(-1)
      end

      t = Abscss::Traverser.new
      ARGV.each do |arg|
        raw = open(arg).read
        doc = Nokogiri::HTML(raw)
        doc.root.children.each do |child|
          t.traverse(child)
        end
      end
      puts t.output
    end
  end
end