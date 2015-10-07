
def greeting
  puts "

╦  ╦┌─┐┌┬┐┌─┐┬─┐  ╔═╗┬┌┬┐┬ ┬┬  ┌─┐┌┬┐┌─┐┬─┐
╚╗╔╝│ │ │ ├┤ ├┬┘  ╚═╗│││││ ││  ├─┤ │ │ │├┬┘
 ╚╝ └─┘ ┴ └─┘┴└─  ╚═╝┴┴ ┴└─┘┴─┘┴ ┴ ┴ └─┘┴└─
  "
  puts "Welcome to the voting booth!"
end

def author_info
  puts "

  ---------------------------------------------------------------------------------------------------------
  Created by Madelene Campos at Wyncode Academy. October 2-  , 2015
  ---------------------------------------------------------------------------------------------------------


  "
end

greeting

#you can only call a method within a class on the instance of the class

class Voter
  attr_accessor  :name, :party
  def initialize (full_name, party)
      @name = full_name
      @party = party
  end
end

class Politician
  attr_accessor :name, :party
  def initialize(name, party)
    @name = name
    @party = party
  end
end

class VotingBooth
  attr_accessor :voters, :politicians
  def initialize
    @voters = []
    @politicians = []
  end

  def  add_voters(the_voter_that_wants_in)
    @voters << the_voter_that_wants_in
  end

  def add_politicians(politicians_that_want_in)
    @politicians << politicians_that_want_in
  end

  def list_voter
    # puts "List of voters"
      @voters.each do |voter|
        puts "Name: #{voter.name}, Affiliation: #{voter.party}"
      end
  end

  def list_politician
    # puts "List of politicians"
      @politicians.each do |politician|
        puts "Name: #{politician.name}, Affiliation: #{politician.party}"
    end
  end
end

@votingbooth = VotingBooth.new

# this method allows user input to create a  voter
def add_new_voter
  puts "Please enter your name:"
  print "> "
  name_I_entered = gets.chomp.capitalize
  puts "Please choose from the following options: (L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral"
    print "> "
    party_i_entered = gets.chomp.capitalize
    case party_i_entered
      when
        "L"
        puts "You have chosen Liberal"
        party_i_entered = "Liberal"
      when
        "C"
        puts "You have chosen Conservative"
        party_i_entered = "Conservative"
      when
        "T"
        puts "You have chosen Tea Party"
        party_i_entered = "Tea Party"
      when
        "S"
        puts "Socialist"
        party_i_entered = "Socialist"
      when
        "N"
        puts "Neutral"
        party_i_entered = "Neutral"
      else
        puts "Try again. Make sure you're choosing from the above options."
        add_new_voter
  end

    new_voter = Voter.new(name_I_entered, party_i_entered)
    @votingbooth.add_voters(new_voter)
    puts "The new voter name is #{new_voter.name} and the affiliation is #{new_voter.party}"

end

def add_new_politician
  puts "Please enter the name of a politician"
  print "> "
  name_I_entered = gets.chomp.capitalize
  puts "Please enter your party:"
  puts "Party? (D)emocrat or (R)epublican"
  print "> "
  party_i_entered = gets.chomp.capitalize
    case party_i_entered
      when
        "D"
        puts "You have chosen Democrat"
        party_i_entered = "Democrat"
      when
        "R"
        puts "You have chosen Republican"
        party_i_entered = "Republican"

      else
        puts "Try again. Make sure you're choosing from the above options."
        add_new_politician
    end

    new_politician = Politician.new(name_I_entered, party_i_entered)
    @votingbooth.add_politicians(new_politician)
    puts "Your new politician is #{new_politician.name} affiliated to the #{new_politician.party} party"
  end

  def update_choices
    puts "Who would you like to update? (V)oter, (P)olitician"
    print "> "
    update_choice = gets.chomp.upcase.to_s
    case update_choice
      when "V"
        puts "Here is your voter list: "
        @votingbooth.list_voter
         update_voter
      when "P"
        puts "Here is your politician list: "
        @votingbooth.list_politician
        update_politician
    end
  end


def update_politician
      puts "Please enter the name of the politician you wish to update:"
      print "> "
      politician_old_name = gets.chomp
      # politician_old_name = politician_old_name.split.map(&:capitalize).join(' ')
      @votingbooth.politicians.each do |politician|
        if politician.name == politician_old_name
          @votingbooth.politicians.delete(politician)
          puts "Please update the information now."
          add_new_politician
        else
          puts "Sorry. There is no record of a politician named #{politician_old_name}."
        end
      end
    end

def update_voter
      puts "Please enter the name of the voter you wish to update:"
      print "> "
      voter_old_name = gets.chomp
      # voter_old_name = voter_old_name.split.map(&:capitalize).join(' ')
      @votingbooth.voters.each do |voter|
        if voter.name == voter_old_name
          @votingbooth.voters.delete(voter)
          puts "Please update the information now."
          add_new_voter
        else
          puts "Sorry. There is no record of a voter named #{voter_old_name}."
        end
      end
    end


loop do
puts "What would you like to do? (C)reate, (L)ist Voters, L(I)st Politicians, (U)pdate, or (V)ote or (Q)uit?"
  print "> "
  initial_choice = gets.chomp.upcase.to_s
    case initial_choice
    when "C"
      puts "What would you like to create? (P)olitician or (V)oter?"
      print "> "
      type = gets.chomp.upcase.to_s
      case type
      when "P"
        add_new_politician
      when "V"
        add_new_voter
      end
    when "L"
      puts "Here is your voter list: "
      @votingbooth.list_voter
    when "I"
      puts "Here is your politician list: "
      @votingbooth.list_politician
    when "U"
      update_choices      # I will need to iterate over the array of people and politicians and *change* the user input.
    # when "V"
      #call method to start simulation here
    when "Q"
      puts "Thank you for participating"
      exit
    else
      puts "Try again. Please enter (C)reate, (L)ist, (U)pdate, or (V)ote"
    end
end
