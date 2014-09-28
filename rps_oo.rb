# rps_oo.rb
# Object Oriented version of rock paper scissors game

class Player
  attr_accessor :name, :choice

  def initialize(n)
    @name = n
  end

end

class Person < Player

  def make_choice
    begin
      puts "Hello #{self.name}! Please choose one: (P/R/S)"
      choice = gets.chomp.downcase
    end until RockPaperScissors::CHOICES.keys.include?(choice) 

    self.choice = choice
    puts "You picked #{self.choice}."  
  end   

end

class Computer < Player

  def make_choice
    self.choice = RockPaperScissors::CHOICES.keys.sample
    puts "#{self.name} picked #{self.choice}" 
  end  

end  

class RockPaperScissors

  attr_accessor :person, :computer

  CHOICES = {'p' => "Paper", 'r' => "Rock", 's' => "Scissors" }

  def initialize
    @person = Person.new("Person")
    @computer = Computer.new("Computer")
  end
  
  def run
    puts "Welcome to Rock Paper Scissors! What is your name?"
    person.name = gets.chomp
    person.make_choice
    computer.make_choice
    determine_winner
    play_again?
  end
  
  def determine_winner
    if person.choice == computer.choice
      puts "It's a tie."
    else
      if (person.choice == "p" && computer.choice == "r") || (person.choice == "r" && computer.choice == "s") || (person.choice == "s" && computer.choice == "p")
        display_winner_message(person.choice)
        puts "Congratulations #{person.name}! You won!" 
      else
        display_winner_message(computer.choice) 
        puts "Sorry #{person.name}. Computer won!" 
      end
    end
  end  

  def display_winner_message(winning_pick)
    if winning_pick == "p"
      puts "Paper covers rock!"
    elsif winning_pick == "r"
      puts "Rock breaks scissors!"
    else
      puts "Scissors cuts paper!"
    end
  end 

  def play_again?
    puts "Play again?"
    play_ind = gets.chomp.downcase

    if play_ind == "y" 
      RockPaperScissors.new.run
    end  
  end        
    
end  

RockPaperScissors.new.run  
