=begin

An anagram is a word obtained by rearranging the letters of another word.  
For example, "rats", "tars" and "star" are an anagram group because they are 
made up of the same letters.

Given an array of strings, write a method that groups them into anagram groups and 
returns the array of groups.  Case doesn't matter in classifying string as anagrams 
(but case should be preserved in the output), and the order of the anagrams in the 
groups doesn't matter.

=end

def combine_anagrams(words)
	hash = {}
	words.each do |word|
		string_to_compare = word.downcase.chars.sort.join
		if hash[string_to_compare]
			hash[string_to_compare].push(word)
		else
			hash[string_to_compare] = [word]
		end
	end
	
	combined_anagram = []
	
	hash.each do |key, value|
		combined_anagram.push(value)
	end
	
	return combined_anagram
end
	
input = ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream'] 
#  => output:  [["cars", "racs", "scar"], ["four"], ["for"], ["potatoes"], 
# ["creams", "scream"]]

output = combine_anagrams(input)

puts output.inspect