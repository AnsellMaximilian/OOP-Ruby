def caesar_cipher(string, shift)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    shiftedWord = ''
    cap = false

    for i in 0..(string.length - 1)
        shifter = shift
        if !alphabet.include? string[i].downcase
            shiftedWord += string[i]
        else
            for j in 0..(alphabet.length - 1)

                if string[i].downcase === alphabet[j]

                    if (j+shifter) > (alphabet.length - 1)
                        shifter = shifter - (alphabet.length - 1) + j - 1 

                        while shifter > (alphabet.length - 1) do
                            shifter = shifter - (alphabet.length - 1) - 1
                            
                        end

                        if string[i] == string[i].upcase
                            shiftedWord += alphabet[shifter].upcase
                        else
                            shiftedWord += alphabet[shifter]
                        end

                    else
                        if string [i] == string[i].upcase
                            shiftedWord += alphabet[j+shifter].upcase
                        else
                            shiftedWord += alphabet[j+shifter]
                        end
                    end
                
                end
            end

        end 
    end
    puts shiftedWord
end

answer = ''
shift = 0
until answer == "q" do
    puts "Enter Your Word, or Exit (Type q):"
    answer = gets.chomp
    if answer != "q"
        puts "Enter Shift:"
        shift = gets.chomp.to_i
        caesar_cipher(answer, shift)
    end
end
