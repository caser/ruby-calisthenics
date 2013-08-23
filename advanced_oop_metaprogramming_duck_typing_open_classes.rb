=begin

In lecture we saw how attr_accessor uses metaprogramming to create 
getters and setters for object attributes on the fly.
Define a method attr_accessor_with_history that provides the same 
functionality as attr accessor but also tracks every value the attribute has ever had:

=end

class Class
	def attr_accessor_with_history(attr_name)
		attr_name = attr_name.to_s
		attr_reader attr_name
		
		# Setter
		self.class_eval %Q{
		def #{arg}=(val)
			@#{arg}=val
			@#{arg}_history ||= [nil]
			@#{arg}_history.push(val)
		end}
		
		# Return history
		self.class_eval %Q{
		def #{arg}_history
			@#{arg}_history ||= [nil]
			@#{arg}_history.inspect
		end
		}
	end
end	

class Foo 
  attr_accessor_with_history :bar
end

f = Foo.new
f.bar = 1
f.bar = 2
f = Foo.new
f. bar = 4
puts f.bar_history
