#!/usr/bin/env ruby

# frozen_string_literal: true

# rubocop: disable Metrics/CyclomaticComplexity

# rubocop: disable Metrics/PerceivedComplexity

class Messages
  def opening
    'Game has started now! Player 1 turn ..'
  end

  def move_is_wrong
    'Move is wrong'
  end

  def error_message
    'Error: coordinates are occupied'
  end

  def error_coordinates
    'Error: coordinates are not between 1-3'
  end

  def winner_msg(name)
    "Player #{name} Wins !"
  end

  def no_cells
    'No more cells !'
  end
end

class TicTacToe < Messages
  def initialize
    # @table = [[1,1,2],[2,2,1],[0,0,1]]
    @table = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    @count = 0
    @available = 0
    @crdnts = ''
  end

  def getcrdnts
    @crdnts
  end

  def setcrdnts(crd)
    @crdnts = crd
  end

  def return_table
    @table
  end

  def return_count
    @count
  end

  def setting_count(count)
    @count = count
  end

  def put_table
    @table.each do |x|
      x.each do |y|
        if y == 1
          # print ' O '
        elsif y == 2
          # print ' X '
        end
      end
      # puts ' '
    end
  end

  def setting_table(arr)
    @table = arr
  end

  def move(player)
    available_cells
    coordinates = @crdnts
    if @available.none?(coordinates)
      move_is_wrong
      # move(player)
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
        puts error_message
        # move(player)
      else
        @table[coorx][coory] = player
      end
    else
      puts error_coordinates
    end
  end

  def winner(name)
    arr = [0, 1, 2]

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
      # puts no_cells
      return true
    end

    false
  end

  def available_cells
    i = 0
    j = 0
    @available = []
    # puts "Pick a location from: "
    @table.each do |x|
      x.each do |y|
        if y.zero?
          # print " [ #{j}#{i} ] "
          a = j.to_s + i.to_s
          @available.push(a)
        end
        i += 1
      end
      i = 0
      j += 1
    end
    # puts " "
  end
end

# rubocop: enable Metrics/CyclomaticComplexity

# rubocop: enable Metrics/PerceivedComplexity
