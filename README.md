# TerminalHelpers

Collection of helper methods for terminal applications. Zero dependencies. 

## Installation

Install from rubygems:

```
gem install terminal_helpers
```

Build locally:

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

See LICENSE file for details