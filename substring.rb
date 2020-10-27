def substrings(word, dictionary)
    word = word.split(" ").join
    dictionary.reduce(Hash.new(0)) do |result, match|
        index = 0
        while word[index..(word.length - 1)].match(match) do
            result[match] += 1
            index += word[index..(word.length - 1)].index(match) + 1
        end
        result
    end

end

dictionary = ["where", "in", "the", "world"]

word = ''

until word == "q" do
    puts "Enter Your Word, or Exit (Type q):"
    word = gets.chomp
    puts substrings(word, dictionary)
end