class CartesianProduct
	attr_accessor :cartesian_array
  	include Enumerable
  	def initialize(set1, set2)
		@cartesian_array = []
		set1.each do |x|
			set2.each do |y|
				@cartesian_array.push([x, y])
			end
		end
		return @cartesian_array
	end
	def each(&block)
		@cartesian_array.each do |pair|
			block.call(pair)
		end
	end
end
 
c = CartesianProduct.new([:a,:b], [4,5])
c.each { |elt| puts elt.inspect }
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]
 
c = CartesianProduct.new([:a,:b], [])
c.each { |elt| puts elt.inspect }
# (nothing printed since Cartesian product
# of anything with an empty collection is empty)