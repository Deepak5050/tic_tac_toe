require_relative 'cell'
require_relative 'board'
require_relative 'player'
require_relative 'game'
require_relative 'core_extensions'

deepak = Player.new(name: "Deepak", color: "X")
kiran = Player.new(name: "Kiran", color: "O")
puts deepak.name
game = Game.new([deepak, kiran])

game.play

