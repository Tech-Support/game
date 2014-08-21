class Item

	attr_accessor :can_pass_through, :can_pickup
	alias_method :can_pass_through?, :can_pass_through
	alias_method :can_pickup?, :can_pickup

	def initialize(window)
		@window = window
		@can_pass_through = true
		@can_pickup = true
	end

	def draw
	end

end

class SolidItem

	def initialize(window)
		super
		@can_pass_through = false
		@can_pickup = false
	end

end
