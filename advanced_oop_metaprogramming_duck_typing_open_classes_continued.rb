=begin

Extend the currency-conversion example from lecture so that you can write
5.dollars.in(:euros)
10.euros.in(:rupees)
etc.
You should support the currencies 'dollars', 'euros', 'rupees' , 'yen' where the 
conversions are: rupees to dollars, multiply by 0.019; yen to dollars, 
multiply by 0.013; euro to dollars, multiply by 1.292.
Both the singular and plural forms of each currency should be acceptable, 
e.g. 1.dollar.in(:rupees) and 10.rupees.in(:euro) should work.

# metaprogramming to the rescue!
class Numeric
	@@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1.000}
  	def method_missing(method_id, *args, &block)  # capture all args in case have to call super
    	singular_currency = method_id.to_s.gsub( /s$/, '')
    	if @@currencies.has_key?(singular_currency)
      		self * @@currencies[singular_currency]
      	elsif method_id.to_s == "in"
      		self.inspect
      		conversion_currency = args[0].to_s.gsub( /s$/, '')
      		puts self / @@currencies[conversion_currency]
    	else
      		super
    	end
  	end
end

5.dollars.in(:euros)
10.euros.in(:rupees)

=end

=begin

Adapt your solution from the "palindromes" question so that instead of writing 
palindrome?("foo") you can write "foo".palindrome?  HINT: this should require fewer 
than 5 lines of code.

class String
	def palindrome?
		string = self.downcase.gsub(/[\W|\d]+/, "")
		string_reverse = string.reverse
		if string =~ /#{string_reverse}/ix
			puts "#{self} is a palindrome!"
		else
			puts "#{self} is not a palindrome!"
		end
	end
end

foo1 = "A man, a plan, a canal -- Panama" #=> true
foo2 = "Madam, I'm Adam!"  # => true
foo3 = "Abracadabra"  # => false (nil is also ok)

foo1.palindrome?
foo2.palindrome?
foo3.palindrome?

=end

=begin

c) Adapt your palindrome solution so that it works on Enumerables.  That is:
[1,2,3,2,1].palindrome?   # => true
(It's not necessary for the collection's elements to be palindromes themselves--
only that the top-level collection be a palindrome.)  HINT: this should require fewer 
than 5 lines of code.  Although hashes are considered Enumerables, your solution 
does not need to make sense for hashes (though it should not error).

=end

class Array
	def palindrome?
		reversed = self.reverse
		if self == reversed
			true
		else
			false
		end
	end
end



puts [1,2,3,2,1].palindrome?


























