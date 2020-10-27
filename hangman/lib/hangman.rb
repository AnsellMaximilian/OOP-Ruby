require 'yaml'

class Hangman
    @@words = File.readlines "5desk.txt"
    def initialize(word = '', strikes = 0, guesses = [])
        # choose word between 5 - 12 in length
        @word = word
        until @word.length >= 5 && @word.length <= 12 do
            @word = @@words[rand(@@words.length)].gsub(/\s+/, "")
        end

        @strikes = strikes
        @guesses = guesses
    end

    def save_game
        saved_game = YAML.dump({
            :word => @word,
            :strikes => @strikes,
            :guesses => @guesses
        })

        save = File.open "save.txt", "w"
        save.puts saved_game
        save.close
    end

    def self.load_game
        load = File.read "save.txt"
        load_data = YAML.load load
        Hangman.new(load_data[:word], load_data[:strikes], load_data[:guesses])
    end

    def hangman
        %{ 
            ____
            |  #{@strikes >= 1 ? "o" : " "} 
            | #{@strikes >= 2 ? "/" : " "}#{@strikes >= 3 ? "|" : " "}#{@strikes >= 4 ? "\\" : " "}
            | #{@strikes >= 5 ? "/" : " "} #{@strikes >= 6 ? "\\" : " "}}
    end

    def get_guess
        print "\nGuess a letter (or type 'save' to save game): "
        guess = gets.chomp
        if guess == "save"
            save_game
            puts "Saved game."
            return "exit"
        end

        while guess.length > 1 do
            print "One letter at a time! Guess again: "
            guess = gets.chomp
        end

        while @guesses.include? guess do
            print "Letter already guessed! Try again: "
            guess = gets.chomp
            while guess.length > 1 do
                print "One letter at a time! Guess again: "
                guess = gets.chomp
            end
        end
        
        @guesses.append(guess)
        @strikes = @strikes + 1 unless @word.split("").include?(guess)
    end

    def check_win_loss
        if @strikes == 6
            puts hangman
            puts "YOU LOST!"
            puts "The word was #{@word}"
            File.open("save.txt", "w"){|file| puts ''}
            return true
        end
    
        current_guess = ""
        @word.split("").each do |letter|
            current_guess += @guesses.include?(letter) ? letter : "_"
        end
    
        unless current_guess.include? "_"
            puts hangman
            puts "YOU WIN"
            puts "The word was #{@word}"
            File.open("save.txt", "w"){|file| puts ''}
            return true
        end
    end

    def game
        while true do
            puts hangman
            @word.split("").each do |letter|
                print @guesses.include?(letter) ? "#{letter} " : "_ "
            end
            @guesses.each_with_index do |letter, index|
                if index == 0
                    print @word.include?(letter) ? "\n" : "\n#{letter} "
                else
                    print @word.include?(letter) ? "" : "#{letter} "
                end
            end

            break if get_guess == "exit"

            break if check_win_loss
        end
    end
end

if File.zero? "save.txt"
    game = Hangman.new
    game.game
else
    puts "A saved game is avaliable. Load? (press y/n) "
    if gets.chomp.downcase == "y"
        game = Hangman.load_game
        game.game
    else
        File.open("save.txt", "w"){|file| puts ''}
        game = Hangman.new
        game.game
    end
end