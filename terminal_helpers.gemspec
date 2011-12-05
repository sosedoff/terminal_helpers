require File.expand_path('../lib/terminal_helpers/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "terminal_helpers"
  s.version     = TerminalHelpers::VERSION.dup
  s.summary     = "Various helpers for console-based applications"
  s.description = "Various helpers for console-based applications"
  s.homepage    = "http://github.com/sosedoff/terminal_helpers"
  s.authors     = ["Dan Sosedoff"]
  s.email       = ["dan.sosedoff@gmail.com"]
    
  s.files              = `git ls-files`.split("\n")
  s.test_files         = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables        = `git ls-files -- bin/*`.split("\n").map{|f| File.basename(f)}
  s.require_paths      = ["lib"]
end