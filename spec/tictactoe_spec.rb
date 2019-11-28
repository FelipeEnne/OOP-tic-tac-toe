# frozen_string_literal: true

require_relative '../lib/main_test'

RSpec.describe TicTacToe do
  describe '#initialize' do
    let(:a) { TicTacToe.new }

    it 'setup the board' do
      expect(a.return_table).to eql([[0, 0, 0], [0, 0, 0], [0, 0, 0]])
    end

    it 'should return the variable count' do
      expect(a.return_count).to eql(0)
    end
  end

  describe '#setting_count' do
    let(:a) { TicTacToe.new }

    it 'should set the variable count' do
      expect(a.setting_count(1)).to eql(a.return_count)
    end
  end

  describe '#put_table' do
    let(:a) { TicTacToe.new }

    it 'should puts the table' do
      expect(a.put_table).to eql(a.return_table)
    end
  end

  describe '#setting_table' do
    let(:a) { TicTacToe.new }

    it 'should set the table' do
      expect(a.setting_table([[1, 2, 1], [0, 0, 0], [0, 0, 0]])).to eql(a.return_table)
    end
  end

  describe '#move' do
    let(:a) { TicTacToe.new }

    it 'should call setmove' do
      a.setting_table([[0, 0, 0], [0, 0, 0], [0, 0, 0]])
      a.setcrdnts('22')
      expect(a.move(1)).to eql(a.return_count)
    end

    it 'is wrong move' do
      a.setcrdnts('45')
      a.move(1)
      expect(a.move(1)).to eql(a.move_is_wrong)
    end
  end

  describe '#setmove' do
    let(:a) { TicTacToe.new }

    it 'should set the move on the table' do
      a.setting_table([[0, 0, 0], [0, 0, 0], [0, 0, 0]])
      a.setmove('00', 2)
      expect(a.return_table).to eql([[2, 0, 0], [0, 0, 0], [0, 0, 0]])
      p
    end
  end

  describe '#player name' do
    let(:a) { TicTacToe.new }
    let(:name1) { 'ilhan' }
    let(:name2) { 'felipe' }

    it 'assigns name to a player' do
      expect(name1).to eql('ilhan')
      expect(name2).to eql('felipe')
    end
  end

  describe '#winner' do
    let(:arrs) { %w[00 01 02] }
    let(:a) { TicTacToe.new }
    let(:name2) { 'felipe' }

    it 'winner' do
      a.setting_table([[0, 0, 0], [0, 0, 0], [0, 0, 0]])
      i = 0
      while i < arrs.length
        a.setcrdnts(arrs[i])
        a.move(2)
        i += 1
      end
      expect(a.winner(name2)).to eql(true)
    end
  end

  describe '#draw' do
    let(:a) { TicTacToe.new }

    it 'draw' do
      a.setting_table([[1, 1, 2], [2, 2, 1], [1, 2, 0]])
      a.setcrdnts('22')
      a.move(1)
      a.setting_count(9)
      expect(a.draw).to eql(true)
    end
  end

  describe '#available_cells' do
    let(:a) { TicTacToe.new }

    it 'return the table cell' do
      expect(a.available_cells).to eql(a.return_table)
    end
  end

  describe 'opening' do
    let(:a) { TicTacToe.new }

    it 'return an opening message' do
      expect(a.opening).to eql('Game has started now! Player 1 turn ..')
    end
  end

  describe 'move_is_wrong' do
    let(:a) { TicTacToe.new }

    it 'return wrong move message' do
      expect(a.move_is_wrong).to eql('Move is wrong')
    end
  end

  describe 'error_message' do
    let(:a) { TicTacToe.new }

    it 'return an error message for occupied cell' do
      expect(a.error_message).to eql('Error: coordinates are occupied')
    end
  end

  describe 'error_coordinates' do
    let(:a) { TicTacToe.new }

    it 'return an error message for coordinates input' do
      expect(a.error_coordinates).to eql('Error: coordinates are not between 1-3')
    end
  end

  describe 'winner_msg(name)' do
    let(:a) { TicTacToe.new }
    let(:name) { 'felipe' }

    it 'return an message for the name of the winner' do
      expect(a.winner_msg(name)).to eql('Player felipe Wins !')
    end
  end

  describe 'no_cells' do
    let(:a) { TicTacToe.new }

    it 'return an error message for no cell left' do
      expect(a.no_cells).to eql('No more cells !')
    end
  end
end
