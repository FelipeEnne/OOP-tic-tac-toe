#!/usr/bin/env ruby

# frozen_string_literal: true

# rubocop: disable Metrics/MethodLength

class TicTacToe
  def initialize
    @table = [[0,0,0],[0,0,0],[0,0,0]]
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

  def winner(player)
    print "Player#{player} Wins !"
  end

  def no_cells
    puts 'No more cells !'
  end
end

# rubocop: enable Metrics/MethodLength

a = TicTacToe.new
a.put_table
a.opening