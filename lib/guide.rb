require 'restaurant'
class Guide

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
    #whatdo you want to do? (list, find, add, quit)
    #do that action
    #repeat until user quits
    conclusion
  end

  def introduction
    puts "Welcome to the Food Finder"
    puts "This is an interactive guide to help you find the food you crave"
  end

  def conclusion
  puts "GoodBye and Bon Appetit"
  end
end
