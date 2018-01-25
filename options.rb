class Options

  def initialize
  end

#Main menu for the game Voter Simulation
  def self.main_nav
    puts "What would you like to do? \n (C)reate \n (L)ist \n (U)pdate \n (D)elete "
    answer = gets.chomp.capitalize
    case answer
    when "C"
      #create a politician or a voter
      creation
    when "L"
      #list the voters and/or? politicians
      list
    when "U"
      #update a politician
      update
    when "D"
      #delete a politican or a voter
      delete
    else
      puts "Command not recognized."
      main_nav
    end
  end

#Create a voter or a politician
  def self.creation
    puts "Would you like to create a \n (P)olitician \n (V)oter"
    answer = gets.chomp.capitalize
    case answer
      when "P"
        Politician.new
      when "V"
        Voter.new
      else
        "Please pick whether you would like to create a voter or politician"
        creation
      end
      main_nav
  end

#List the voters or politicians
  def self.list
    puts "Would you like to list the \n (P)oliticians \n (V)oters"
    answer = gets.chomp.capitalize
    case answer
      when "P"
        puts Politician.get_info
      when "V"
        puts Voter.get_info
      else
        puts "Please select who you would like to list, Voters or Politicians."
        list
    end
    main_nav
  end

#Update the information within a voter or a politician
    def self.update
      puts "Would you like to update a (V)oter | (P)olitician"
      answer = gets.chomp.capitalize
      case answer
      when "V"
        Voter.update_voter
      when "P"
        Politician.update_politician
      else
        puts "Please select either V to update a Voter or P to update a Politician."
        update
      end
      main_nav
    end

    def self.delete
      puts "Would you like to delete a (V)oter | (P)olitician"
      answer = gets.chomp.capitalize
      case answer
      when "V"
        Voter.delete_voter
      when "P"
        Politician.delete_politician
      else
        puts "Please select either V to delete a Voter or P to update a Politician."
        delete
      end
      main_nav
    end

end
