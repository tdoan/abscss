require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "abscss"
    gem.summary = %Q{Reduce an HTML page into CSS selectors}
    gem.description = %Q{Breadth first search an HTML page and spit out all the branches of the tree as CSS selectors. Simple filtering is currently hardcoded to ignore HTML tags that we don't style.}
    gem.email = "tdoan@tdoan.com"
    gem.homepage = "http://github.com/tdoan/abscss"
    gem.authors = ["Tony Doan"]
    gem.add_runtime_dependency "nokogiri"
    gem.add_development_dependency "thoughtbot-shoulda", ">= 0"
    gem.files = %w{LICENSE ReADME.rdoc Rakefile VERSION lib/abscss.rb lib/cli.rb bin/abscss}
    end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "abscss #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
