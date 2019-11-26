#!/usr/bin/env ruby

# frozen_string_literal: true

# rubocop: disable Metrics/MethodLength

class TicTacToe
  def initialize
    @table = [[0,0,0],[0,0,0],[0,0,0]]
    @count = 0
    @available
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
    available_cells
    coordinates = gets.chomp
    if @available.none?(coordinates)
      puts "Move is wrong"
      move(player)
    end
    @count += 1
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
    #if win conditions are true? return true
  end

  def draw
    if @count == 3
      puts "Its a draw move"
      return true
    end
    false
  end

  def available_cells
    i=0
    j=0
    @available = []
    puts "Pick a location from: "
    @table.each do |x|
      x.each do |y|
        if y == 0
          print " [ #{j}#{i} ] "
          a = j.to_s + i.to_s
          @available.push(a)
        end
        i += 1
      end
      i = 0
      j += 1
    end
    puts " "
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
  a.put_table

  if a.winner(player1)
    game_on = false
    break
  end

  if a.draw
    game_on = false
    break
  end

  puts "#{name2} turn:"
  a.move(player2)
  a.put_table

  if a.winner(player2)
    game_on = false
    break
  end

  if a.draw
    game_on = false
    break
  end
end