class GameBoard

    def initialize
        @sq1=@sq2=@sq3=@sq4=@sq5=@sq6=@sq7=@sq8=@sq9= ' '
    end

    def make_board
        puts "|#{@sq1}|#{@sq2}|#{@sq3}|\n|#{@sq4}|#{@sq5}|#{@sq6}|\n|#{@sq7}|#{@sq8}|#{@sq9}|"
    end

    def game
        puts "Who goes first? "
        
        @turn = nil

        until @turn == 'x' || @turn == 'o' do
            @turn = gets.chomp
            puts "Invalid input, try again." if @turn != 'x' && @turn != 'o'
        end
        
        puts "#{@turn} goes first" 

        while @sq1 == ' ' || @sq2 == ' ' || @sq3 == ' ' || @sq4 == ' ' || @sq5 == ' ' || @sq6 == ' ' || @sq7 == ' ' || @sq8 == ' ' || @sq9 == ' ' do
            make_board
            puts "#{@turn}'s Turn'"
            puts "Where? Press 1 - 9"
            @choice = gets.chomp
            
            until @choice == '1' || @choice == '2' || @choice == '3' || @choice == '4' || @choice == '5' || @choice == '6' || @choice == '7' || @choice == '8' || @choice == '9' do
                puts "Invalid input, try again."
                @choice = gets.chomp
            end

            loop do
                case @choice
                    when '1'
                        if @sq1 == ' '
                            break
                        else
                            puts "Square #1 is unavailable."
                            until @choice == '2' || @choice == '3' || @choice == '4' || @choice == '5' || @choice == '6' || @choice == '7' || @choice == '8' || @choice == '9' do
                                puts "Invalid input, try again."
                                @choice = gets.chomp
                            end
                        end
                    when '2'
                        if @sq2 == ' '
                            break
                        else
                            puts "Square #2 is unavailable."
                            until @choice == '1' || @choice == '3' || @choice == '4' || @choice == '5' || @choice == '6' || @choice == '7' || @choice == '8' || @choice == '9' do
                                puts "Invalid input, try again."
                                @choice = gets.chomp
                            end
                        end
                    when '3'
                        if @sq3 == ' '
                            break
                        else
                            puts "Square #3 is unavailable."
                            until @choice == '1' || @choice == '2' || @choice == '4' || @choice == '5' || @choice == '6' || @choice == '7' || @choice == '8' || @choice == '9' do
                                puts "Invalid input, try again."
                                @choice = gets.chomp
                            end
                        end
                    when '4'
                        if @sq4 == ' '
                            break
                        else
                            puts "Square #4 is unavailable."
                            until @choice == '1' || @choice == '2' || @choice == '3' || @choice == '5' || @choice == '6' || @choice == '7' || @choice == '8' || @choice == '9' do
                                puts "Invalid input, try again."
                                @choice = gets.chomp
                            end
                        end
                    when '5'
                        if @sq5 == ' '
                            break
                        else
                            puts "Square #5 is unavailable."
                            until @choice == '1' || @choice == '2' || @choice == '3' || @choice == '4' || @choice == '6' || @choice == '7' || @choice == '8' || @choice == '9' do
                                puts "Invalid input, try again."
                                @choice = gets.chomp
                            end
                        end
                    when '6'
                        if @sq6 == ' '
                            break
                        else
                            puts "Square #6 is unavailable."
                            until @choice == '1' || @choice == '2' || @choice == '3' || @choice == '4' || @choice == '5' || @choice == '7' || @choice == '8' || @choice == '9' do
                                puts "Invalid input, try again."
                                @choice = gets.chomp
                            end
                        end
                    when '7'
                        if @sq7 == ' '
                            break
                        else
                            puts "Square #7 is unavailable."
                            until @choice == '1' || @choice == '2' || @choice == '3' || @choice == '4' || @choice == '5' || @choice == '6' || @choice == '8' || @choice == '9' do
                                puts "Invalid input, try again."
                                @choice = gets.chomp
                            end
                        end
                    when '8'
                        if @sq8 == ' '
                            break
                        else
                            puts "Square #8 is unavailable."
                            until @choice == '1' || @choice == '2' || @choice == '3' || @choice == '4' || @choice == '5' || @choice == '6' || @choice == '7' || @choice == '9' do
                                puts "Invalid input, try again."
                                @choice = gets.chomp
                            end
                        end
                    when '9'
                        if @sq9 == ' '
                            break
                        else
                            puts "Square #9 is unavailable."
                            until @choice == '1' || @choice == '2' || @choice == '3' || @choice == '4' || @choice == '5' || @choice == '6' || @choice == '7' || @choice == '8' do
                                puts "Invalid input, try again."
                                @choice = gets.chomp
                            end
                        end
                end
            end

            case @choice
                when '1' then @sq1 = @turn
                when '2' then @sq2 = @turn
                when '3' then @sq3 = @turn
                when '4' then @sq4 = @turn
                when '5' then @sq5 = @turn
                when '6' then @sq6 = @turn
                when '7' then @sq7 = @turn
                when '8' then @sq8 = @turn
                when '9' then @sq9 = @turn
            end

            break if check_winner

            @turn == 'x' ? @turn = 'o' : @turn = 'x'

        end




    end

    def check_winner
        if @turn == 'x'
            if (@sq1 == 'x' && @sq2 == 'x' && @sq3 == 'x') || (@sq4 == 'x' && @sq5 == 'x' && @sq6 == 'x') || (@sq7 == 'x' && @sq8 == 'x' && @sq9 == 'x') || (@sq1 == 'x' && @sq4 == 'x' && @sq7 == 'x') || (@sq2 == 'x' && @sq5 == 'x' && @sq8 == 'x') || (@sq3 == 'x' && @sq6 == 'x' && @sq9 == 'x') || (@sq1 == 'x' && @sq5 == 'x' && @sq9 == 'x') || (@sq3 == 'x' && @sq5 == 'x' && @sq7 == 'x')
                make_board
                puts "x won!"
                true
            end
        else
            if (@sq1 == 'o' && @sq2 == 'o' && @sq3 == 'o') || (@sq4 == 'o' && @sq5 == 'o' && @sq6 == 'o') || (@sq7 == 'o' && @sq8 == 'o' && @sq9 == 'o') || (@sq1 == 'o' && @sq4 == 'o' && @sq7 == 'o') || (@sq2 == 'o' && @sq5 == 'o' && @sq8 == 'o') || (@sq3 == 'o' && @sq6 == 'o' && @sq9 == 'o') || (@sq1 == 'o' && @sq5 == 'o' && @sq9 == 'o') || (@sq3 == 'o' && @sq5 == 'o' && @sq7 == 'o')
                make_board
                puts "o won!"
                true
            end
        end
    end

end

as = GameBoard.new()

as.game