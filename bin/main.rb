#!/usr/bin/env ruby

# frozen_string_literal: true

# rubocop: disable Metrics/MethodLength

class Messages
  def opening
    puts 'Game has started now! Player 1 turn ..'
  end

  def error_message
    puts 'Error: coordinates are occupied'
  end

  def error_coordinates
    puts 'Error: coordinates are not between 1-3'
  end

  def winner_msg(name)
    print "Player #{name} Wins !"
    true
  end

  def no_cells
    puts 'No more cells !'
  end
end

class TicTacToe < Messages
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

  def move(player)
    available_cells
    coordinates = gets.chomp
    if @available.none?(coordinates)
      puts "Move is wrong"
      move(player)
    else
      setmove(coordinates, player)
      @count += 1
    end
  end

  def setmove(coordinates, player)
    coorx = coordinates[0].to_i
    coory = coordinates[1].to_i

    if coorx < 3 && coorx >= 0 && coory < 3 && coory >= 0
      if @table[coorx][coory] != 0
        error_message
        move(player)
      else
        @table[coorx][coory] = player
      end
    elsif
      error_coordinates
    end
  end
  
  def winner(name)
    arr = [0,1,2]

    arr.each do |x|
      if @table[x][0] == @table[x][1] && @table[x][1] == @table[x][2] && @table[x][0] != 0
        winner_msg(name)
        return true
      end
    end

    arr.each do |x|
      if @table[0][x] == @table[1][x] && @table[1][x] == @table[2][x] && @table[0][x] != 0
        winner_msg(name)
        return true
      end
    end

    if @table[0][0] == @table[1][1] && @table[1][1] == @table[2][2] && @table[1][1] != 0
      winner_msg(name)
      return true
    end

    if @table[0][2] == @table[1][1] && @table[1][1] == @table[2][0] && @table[1][1] != 0
      winner_msg(name)
      return true
    end
    false
  end

  def draw
    if @count == 9
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
turn = 1

while game_on
  if turn == 1
    puts "#{name1} turn:"
    a.move(player1)
    a.put_table
    turn = 2
  else
    puts "#{name2} turn:"
    a.move(player2)
    a.put_table
    turn = 1
  end

  if a.winner(name1) || a.winner(name2) || a.draw
    game_on = false
    puts " Want to play another game ? y/n"
    r = gets.chomp
    if r == 'y'
      game_on = true
      a = TicTacToe.new
      a.put_table
      a.opening
      turn = 1
    end
  end
end
