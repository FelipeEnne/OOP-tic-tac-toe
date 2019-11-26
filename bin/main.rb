#!/usr/bin/env ruby

# frozen_string_literal: true

# rubocop: disable Metrics/MethodLength

class TicTacToe
  def initialize
    @table = [[0,0,0],[0,0,0],[0,0,0]]
    @count = 0
  end

  def put_table
    @table.each do |x|
      x.each do |y|
        if y == 1
          print ' O '
        elsif y == 2
          print ' X '
        else
          print ' _ '
        end
      end
      puts ' '
    end
  end

  def opening
    puts 'Game has started now! Player 1 turn ..'
  end

  def move(player)
    puts "#{player} coordinates:"
    coordinates = gets.chomp
  end

  def error_message
    puts 'Error: coordinates are occupied'
  end

  def error_coordinates
    puts 'Error: coordinates are not between 1-3'
  end

  def winner_msg(player)
    print "Player#{player} Wins !"
    true
  end
  
  def winner(player)
    puts "The winner is:"
    @count += 1
    if @count == 9
      return true
    end
    false
  end

  def no_cells
    puts 'No more cells !'
  end
end

# rubocop: enable Metrics/MethodLength

a = TicTacToe.new
a.put_table
a.opening

game_on = true

puts "Player1 name:"
name1 = gets.chomp
player1 = 1
puts "Player2 name:"
name2 = gets.chomp
player2 = 2


while game_on

  puts "#{name1} turn:"
  a.move(player1)

  if a.winner(player1)
    game_on = false
  end

  a.put_table

  puts "#{name2} turn:"
  a.move(player2)

  a.put_table

  if a.winner(player2)
    game_on = false
  end

end