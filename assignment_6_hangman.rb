class Hangman
  def start
    @word = ["medidata","patient","clinic","study","site","trial"].sample
    @lives = 6
    @current_word = ''

    @word.size.times do
      @current_word += '_ '
    end
    puts "Your word is #{@word.size} characters long"
    puts "To exit the game type 'exit'"
    display_matched_letter
    make_guess
  end

  def display_matched_letter(last_guess = nil)
    place_matched_letter(last_guess) unless last_guess.nil?
    puts @current_word
  end
end

def place_matched_letter(last_guess)
  new_word = @current_word.split

  new_word.each_with_index do |letter, index|
    new_word[index] = last_guess if letter == '_' && @word[index] == last_guess
  end

  @current_word = new_word.join(' ')
end

def make_guess
  if @lives.positive?
    puts 'Enter a letter'
    guess = gets.chomp.downcase

    correct_guess = @word.include? guess

    if guess == 'exit'
      puts 'Thank you for playing!'
    elsif guess.length > 1
      puts 'At a time guess 1 letter!'
      make_guess

    elsif @current_word.include? guess
      puts 'You have already entered this letter'
      make_guess

    elsif correct_guess
      puts 'You are correct!'
      display_matched_letter(guess)

      if @word == @current_word.split.join
        puts 'Congratulations!!! you have guessed the word successfully!'
        puts 'Do you want to continue : y/n'
        if(gets.chomp.downcase=='n')
            guess='exit'
        else
            start
        end
      else
        make_guess
      end
    else
      @lives -= 1
      puts "you have #{@lives} lives left. Try again!"
      make_guess
    end
  else
    puts 'Game over!!!'
  end
end

game = Hangman.new
game.start
