class StartWindow < Gosu::Window
	def initialize
		super(600, 400, false)
		@player = Player.new(self)
	end
end
