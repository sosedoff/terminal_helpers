# TerminalHelpers

This is a collection of helper method for your console-based applications.

It does not have any gem dependencies and could be easily plugged-in into your existing code.

Was initially inspired by `heroku` terminal utility.

## Installation

You can install it using rubygems:

```
gem install terminal_helpers
```

Or build it:

```
rake install
```

## Usage

To start using terminal_helpers just include it into your app or class:

```ruby
require 'terminal_helpers'
include TerminalHelpers

# or if you have session or somethin
class Session
  include TerminalHelpers
end
```

### Input helpers

```ruby
name     = ask('Your name')
email    = ask('Email address', :required => true, :format => :email)
zipcode  = ask('Zipcode', :format => :zipcode)
domain   = ask('Domain', :format => :domain)
password = ask_password(:confirm => true)
sure     = ask_yesno('Are you sure about this?')
```

### Message helpers

```ruby
empty_line    # print just an empty line
empty_line 50 # print 50 empty lines
prompt        # print '>' and wait for user input
```

Various informative methods:

```ruby
info    'This is INFO message!'
display 'This is another INFO message!'
success 'This is SUCCESS message!'
warning 'This is WARNING message!'
error   'This is ERROR message', true # true means termination after printing
```

To enable disable colors support:

```ruby
TerminalHelpers.use_colors = false # colors are enabled by default
```

### Extras

Execute a shell command:

```ruby
result = shell 'uptime'
```

Enable/disable terminal echo (helpful for password input):

```ruby
echo_on
echo_off
```

## License

Copyright &copy; 2011-2013 Dan Sosedoff.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.