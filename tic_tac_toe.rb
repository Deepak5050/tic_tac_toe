require_relative 'cell'
require_relative 'player'
require_relative 'board'
require_relative 'core_extensions'
require_relative 'game'



puts "Welcome to tic tac toe"

deepak = Player.new({color:'X', name: 'deepak'})
kiran = Player.new({color: 'O', name: 'kiran'})
players = [deepak, kiran]
Game.new(players).play


