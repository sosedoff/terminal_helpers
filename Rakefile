task :install do
  gem_name = "terminal_helpers"
  
  require 'fileutils'
  require File.expand_path("../lib/#{gem_name}/version", __FILE__)
  
  gem_file = "#{gem_name}-#{TerminalHelpers::VERSION}.gem"
  
  if File.exists?(gem_file)
    FileUtils.rm_f(gem_file)
  end
  
  puts "-> Uninstalling..."
  puts `gem uninstall -x #{gem_name} --version=#{TerminalHelpers::VERSION}`
  
  puts "-> Building..."
  puts `gem build #{gem_name}.gemspec`
  
  puts "-> Installing..."
  puts `gem install #{gem_file}`
end