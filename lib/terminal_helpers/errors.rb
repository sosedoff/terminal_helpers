module TerminalHelpers
  class Error           < StandardError ; end
  class InputError      < Error ; end
  class FormatError     < Error ; end
  class ValidationError < Error ; end
end
