
#you can only call a method within a class on the instance of the class

class Voter
  attr_accessor  :name, :party
  def initialize (full_name, party)
      @name = full_name
      @party = party
  end
end

class Politician
  attr_accessor :name, :affiliations
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
         puts voter.name
      end
  end

  def list_politician
    # puts "List of politicians"
      @politicians.each do |politician|
        puts politician.name
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
  loop do
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
      end
    end



    new_voter = Voter.new(name_I_entered, party_i_entered)
    @votingbooth.add_voters(new_voter)

end

def add_new_politician
  puts "Please enter the name of a politician"
  print "> "
  name_I_entered = gets.chomp.capitalize
  puts "Please enter your party:"
  print "> "
  political_party = gets.chomp.capitalize
  new_politician = Politician.new(name_I_entered, political_party)
  @votingbooth.add_politicians(new_politician)
end


loop do
puts "What would you like to do? (C)reate, (L)ist, (U)pdate, or (V)ote or (Q)uit?"
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
      puts "Here is your politician list: "
      @votingbooth.list_politician
    # when "U"
      # puts "Who would you like to update?"
      # I will need to iterate over the array of people and politicians and *change* the user input.
    # when "V"
      #call method to start simulation here
    when "Q"
      puts "Thank you for participating"
      exit
    else
      puts "Try again. Please enter (C)reate, (L)ist, (U)pdate, or (V)ote"
    end
end






