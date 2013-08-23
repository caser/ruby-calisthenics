# Write a method that determines whether a given word or phrase is a palindrome, 
# that is, it reads the same backwards as forwards, ignoring case, punctuation, 
# and nonword characters.  

def palindrome? string
	str = string.downcase
	str = str.gsub(/[\W|\d]+/, "")
	str_backwards = str.reverse
	if str =~ /#{str_backwards}/ix
		puts "#{string} is a palindrome!"
	else
		puts "#{string} is not a palindrome!"
	end
end

palindrome?("A man, a plan, a canal -- Panama")  #=> true
palindrome?("Madam, I'm Adam!")  # => true
palindrome?("Abracadabra")  # => false (nil is also ok)

# Given a string of input, return a hash whose keys are words in the string and 
# whose values are the number of times each word appears.  Don't use for-loops.  
# (But iterators like each are permitted.)  Nonwords should be ignored.  
# Case shouldn't matter. 

def count_words(string)
	str = string.split
	hash = {}
	str.each do |word|
		word = word.downcase.gsub(/[\W|\d]+/, "")
		if hash[word]
			hash[word] += 1
		else
			hash[word] = 1
		end
	end
	puts hash
end
count_words("A man, a plan, a canal -- Panama")
# => {'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1}
count_words "Doo bee doo bee doo"  # => {'doo' => 3, 'bee' => 2}