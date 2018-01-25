require_relative './party'
class Politician
  @@pol_population = []
  attr_accessor :name, :party

  def initialize()
    puts "Name this politician: "
    @name = gets.chomp.capitalize
    @party = select_party
    puts "#{@name} has been created and is a member of the #{@party} party \n
    "

    @@pol_population << self
  end

  def select_party
    puts "Which political party will #{@name} belong to?: \n (D)emocratic \n (R)epublican"
    answer = gets.chomp.capitalize
    case answer
    when "D"
      return "Democratic"
    when "R"
      return "Republican"
    else
      puts "That political party is not recognized. Please select Democrat or Republican."
      select_party
    end
  end

  def self.get_info

    return_string = "Politicians: "
    i = 0
    while i < @@pol_population.length do
      return_string += "#{@@pol_population[i].name} => #{@@pol_population[i].party}\n"
      i += 1
    end
    return_string
  end

  def self.update_politician
    puts "Which politician would you like to update?"
    to_be_updated = gets.chomp.capitalize

    i = 0
    while i < @@pol_population.length do
      if to_be_updated == @@pol_population[i].name
        puts "\n What would you like to update about #{@@pol_population[i].name}?: (N)ame or (P)olitical Party ?"
        answer = gets.chomp.capitalize
        case answer

        #the user wants to change the politicians's name
        when "N"
          #change their name
          puts "What would you like to change #{@@pol_population[i].name}'s name to?"
          new_name = gets.chomp.capitalize
          puts "Success! #{@@pol_population[i].name}'s name has been changed to #{new_name}!"
          @@pol_population[i].name = new_name

      #the user wants to change the politician's political party
        when "P"
          #change their political party
          puts "What should #{@@pol_population[i].name}'s new political party be? (D)emocratic | (R)epublican"
          answer = gets.chomp.capitalize
          case answer
          when "D"
            answer = "Democratic"
            puts "Ok, #{@@pol_population[i].name} is now a member of the #{answer} party!"
            @@pol_population[i].party = answer
          when "R"
            answer = "Republican"
            puts "Ok, #{@@pol_population[i].name} is now a member of the #{answer} party!"
            @@pol_population[i].party = answer
          else
            puts "That is not a recognized political party. You must pick one (R) or (D)!"
          end
        else
          puts "Command not recognized. Please select (N) for name or (P) for Political Party"
        end
      else
        puts "Could not find that politician"
      end
      i += 1
    end
  end

  def self.delete_politician
    puts "Type the full name of the politician you would like to delete:"
    to_be_deleted = gets.chomp.capitalize
    i = 0
    while i < @@pol_population.length do
      if to_be_deleted == @@pol_population[i].name
        puts "#{@@pol_population[i].name} has been deleted!"
        @@pol_population.delete(@@pol_population[i])
      else
        puts "Could not find #{to_be_deleted}."
        delete_politician
      end
      i += 1
    end
  end


end
