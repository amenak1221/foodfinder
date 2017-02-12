require 'restaurant'
class Guide

  class Config
    @@actions = ['list', 'find', 'quit']
    def self.actions; @@actions end
  end

  def initialize(path=nil)
      #locate the restaurant text file at path
    Restaurant.filepath = path
    if Restaurant.file_exists?
      puts "Found a restaurant file."
      #or careat a new file
    elsif Restaurant.create_file
      puts "Created restaurant file."
    #exit if create fails
    else
      puts "exiting"
      exit!
    end
  end

  def launch!
    introduction
    #action loop
    result = nil
    until result == :quit
      action = get_action
      result = do_action(action)
      #whatdo you want to do? (list, find, add, quit)
      #do that action
      #repeat until user quits
     end
    conclusion
  end

  def get_action
    action = nil
    #keep asking for user input until we get a valid action
    until Guide::Config.actions.include?(action)
    puts "Actions:" + Guide::Config.actions.join(",") if action
    print ">"
    user_response = gets.chomp
    action = user_response.downcase.strip
    end
    return action
  end

  def do_action(action)
    case action
    when 'list'
      puts "Listing...."
    when 'find'
      puts "Finding..."
    when "add"
      puts "Adding..."
    when 'quit'
      return :quit
    else
      puts "I don't understand that command."
    end
  end
  def introduction
    puts "Welcome to the Food Finder"
    puts "This is an interactive guide to help you find the food you crave"
  end

  def conclusion
  puts "GoodBye and Bon Appetit"
  end
end
