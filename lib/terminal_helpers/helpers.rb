require 'fileutils'

module TerminalHelpers
  # Ask for the user input
  #
  # title - Input prompt text
  # options - Input options
  #
  # options[:default]  - Default value if input is blank
  # options[:required] - Make input mandatory (default: false)
  # options[:format]   - Validate input data using format
  # options[:echo]     - Enable/disable echo (default: true)
  #
  def ask(title, options={})
    title_str = title.dup
    title_str += " [#{options[:default]}]" unless options[:default].to_s.empty?
    title_str += ": "
    
    echo_off if options[:echo] == false
    
    print(title_str)
    result = STDIN.gets.strip
    result = options[:default] if result.empty? && options.key?(:default)
    #result = result.scan(/[a-z\d\_\-]{1,}/i) if options.key?(:array)
    
    if result.empty? && options[:required]
      empty_line if options[:echo] == false
      return ask(title, options)
    end
    
    empty_line if options[:echo] == false
    echo_on
    
    Validations.validate(result, options[:format], true) if options[:format]
    result
  end
  
  # Prompt for password
  #
  # options[:confirm] - Require a password confirmation (default: false)
  #
  def ask_password(options={})
    password = ask('Password', :required => true, :echo => false)
    if options[:confirm] == true
      confirmation = ask('Confirm password', :required => true, :echo => false)
      if confirmation != password
        raise InputError, "Password confirmation should match."
      end
    end
    password
  end
  
  # Prompt for Y/N question
  #
  def ask_yesno(title, required='y', options={})
    answer = ask("#{title} (y/n)", options).downcase
    answer == required
  end
  
  # Prints an empty line N times
  #
  def empty_line(num=1)
    num.times { info("") }
  end
  
  # Regular prompt with prefix
  #
  def prompt(prefix='> ')
    print("#{prefix}")
    STDIN.gets.strip
  end
  
  # Print an information message
  #
  # message - Information text
  # color - Specify message color (default: none)
  #
  def info(message, color=nil)
    if TerminalHelpers.use_colors
      message = message.send(color) unless color.nil?
    end
    STDOUT.puts(message)
    STDOUT.flush
  end
  
  # Show success message
  #
  def success(message)
    info(message, :green)
  end
  
  # Show warning message
  #
  def warning(message)
    info(message, :yellow)
  end
  
  # Show error message
  #
  def error(message, exit_after=false)
    if TerminalHelpers.use_colors
      message = message.red
    end
    STDERR.puts(message)
    exit(1) if exit_after
  end
  
  # Print message
  #
  def display(message, newline=true)
    if newline
      STDOUT.puts(message)
    else
      STDOUT.print(message)
      STDOUT.flush
    end
  end
  
  # Execure a shell command
  #
  def shell(cmd)
    FileUtils.cd(Dir.pwd) {|d| return `#{cmd}`}
  end
  
  # Disables terminal prompt
  #
  def echo_off
    system("stty -echo")
  end

  # Enables terminal prompt
  #
  def echo_on
    system("stty echo")
  end
end