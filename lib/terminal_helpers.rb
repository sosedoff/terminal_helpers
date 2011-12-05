require 'terminal_helpers/version'
require 'terminal_helpers/errors'
require 'terminal_helpers/validations'
require 'terminal_helpers/colors'
require 'terminal_helpers/helpers'

module TerminalHelpers
  @@use_colors = true
  
  class << self
    def use_colors
      @@use_colors
    end
    
    def use_colors=(value)
      @@use_colors = value == true
    end
  end
end