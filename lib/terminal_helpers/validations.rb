module TerminalHelpers
  module Validations
    extend self
    
    FORMATS = {
      :domain  => /^[a-z\d-]+(\.[a-z\d-]+)*\.(([\d]{1,3})|([a-z]{2,3})|(aero|coop|info|museum|name))$/i,
      :email   => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
      :zipcode => /^[\d]{5}$/,
      :ipv4    => /^[\d]{1,3}\.[\d]{1,3}\.[\d]{1,3}\.[\d]{1,3}$/
    }
    
    # Validate data against provided format
    #
    def validate(value, format, raise_error=false)
      unless FORMATS.key?(format)
        raise FormatError, "Invalid data format: #{format}"
      end
      result = value =~ FORMATS[format] ? true : false
      if raise_error && !result
        raise ValidationError, "Invalid value \"#{value}\" for #{format}"
      end
      result
    end
    
    def email(value)   ; validate(value, :email)   ; end
    def domain(value)  ; validate(value, :domain)  ; end
    def zipcode(value) ; validate(value, :zipcode) ; end
    def ipv4(value)    ; validate(value, :ipv4)    ; end
  end
end
