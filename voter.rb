require_relative './party'

class Voter
  @@population = []
  attr_accessor :name, :bias

  def initialize()
    puts "Name this voter: "
    @name = gets.chomp.capitalize
    #puts "What bias does #{@name} have? \n (L)iberal \n (C)onservative \n (T)ea Party \n (S)ocialist \n (N)eutral"
    @bias = select_bias
    puts "#{@name} has been created with a #{@bias} bias \n"

    @@population << self
  end

#Add a bias to a voter
  def select_bias
    puts "What bias should #{@name} have? (L)iberal | (C)onservative | (T)ea Party | (S)ocialist | (N)eutral"
    answer = gets.chomp.capitalize
    case answer
    when "L"
      return "Liberal"
    when "C"
      return "Conservative"
    when "T"
      return "Tea Party"
    when "S"
      return "Socialist"
    when "N"
      return "Neutral"
    else
      puts "That is not a valid bias to have. You must pick one!"
      select_bias
    end
  end

#Loop through the array of voters then print out their name & their bias
  def self.get_info
    return_string = ""
    puts "Voters: "
    i = 0
    while i < @@population.length do
      return_string += "#{@@population[i].name} => #{@@population[i].bias}"
      i += 1
    end
    return return_string
  end

#Update the name or the bias of a voter who has already beed created
  def self.update_voter
    puts "Which voter would you like to update?"
    to_be_updated = gets.chomp.capitalize

    i = 0
    while i < @@population.length do
      if to_be_updated == @@population[i].name
        puts "\n What would you like to update about #{@@population[i].name}?: (N)ame or (B)ias ?"
        answer = gets.chomp.capitalize
        case answer

        #the user wants to change the voter's name
        when "N"
          #change their name
          puts "What would you like to change #{@@population[i].name}'s name to?"
          new_name = gets.chomp.capitalize
          puts "Success! #{@@population[i].name}'s name has been changed to #{new_name}!"
          @@population[i].name = new_name

        #the user wants to change the voter's bias
        when "B"
          #change their bias
          puts "What should #{@@population[i].name}'s new bias be? (L)iberal | (C)onservative | (T)ea Party | (S)ocialist | (N)eutral"
          answer = gets.chomp.capitalize
          case answer
          when "L"
            answer = "Liberal"
            puts "Ok, #{@@population[i].name} now has a #{answer} bias!"
            @@population[i].bias = answer
          when "C"
            answer = "Conservative"
            puts "Ok, #{@@population[i].name} now has a #{answer} bias!"
            @@population[i].bias = answer
          when "T"
            answer = "Tea Party"
            puts "Ok, #{@@population[i].name} now has a #{answer} bias!"
            @@population[i].bias = answer
          when "S"
            answer = "Socialist"
            puts "Ok, #{@@population[i].name} now has a #{answer} bias!"
            @@population[i].bias = answer
          when "N"
            answer = "Neutral"
            puts "Ok, #{@@population[i].name} now has a #{answer} bias!"
            @@population[i].bias = answer
          else
            puts "That is not a valid bias to have. You must pick one!"
          end
        else
          puts "Command not recognized. Please select (N) for name or (B) for Bias"
        end
      end
      i += 1
    end
  end

  def self.delete_voter
    puts "Type the full name of the voter you would like to delete:"
    to_be_deleted = gets.chomp.capitalize
    i = 0
    while i < @@population.length do
      if to_be_deleted == @@population[i].name
        puts "#{@@population[i].name} has been deleted!"
        @@population.delete(@@population[i])
      else
        puts "Could not find #{to_be_deleted}."
        delete_voter
      end
      i += 1
    end
  end

end
