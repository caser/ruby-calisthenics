=begin

(a) Create a class Dessert with getters and setters for name and calories.  
Define instance methods healthy?, which returns true if a dessert has less than 
200 calories, and delicious?, which returns true for all desserts.

(b) Create a class JellyBean that extends Dessert, and add a getter and 
setter for flavor.  Modify delicious? to return false if the flavor is black licorice 
(but delicious? should still return true for all other flavors and for all 
non-JellyBean desserts).

=end

class Dessert
	attr_accessor :name
	attr_accessor :calories
	
	def initialize(name, calories)
		@name = name
		@calories = calories
	end
	
	def healthy?
		if @calories < 200
			return true
		else
			return false
		end
	end
	
	def delicious?
		return true
	end
end

class JellyBean < Dessert
	attr_accessor :flavor
	
	def initialize(name, calories, flavor)
		@name = name
		@calories = calories
		@flavor = flavor
	end
	
	def delicious?
		if flavor =~ /black licorice/i
			return false
		else
			return true
		end
	end
end

pie = Dessert.new("pie", 1300)
fruit = Dessert.new("fruit", 100)
jellybean1 = JellyBean.new("jellybean", 5, "black licorice")
jellybean2 = JellyBean.new("jellybean", 5, "marshmallow")

puts "Is pie healthy? #{pie.healthy?}"
puts "Is pie delicious? #{pie.delicious?}"

puts "Is fruit healthy? #{fruit.healthy?}"
puts "Is fruit delicious? #{fruit.delicious?}"

puts "Is jellybean1 healthy? #{jellybean1.healthy?}"
puts "Is jellybean1 delicious? #{jellybean1.delicious?}"

puts "Is jellybean2 healthy? #{jellybean2.healthy?}"
puts "Is jellybean2 delicious? #{jellybean2.delicious?}"
