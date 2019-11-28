# frozen_string_literal: true

# rubocop: disable Style/GlobalVars

require_relative '../lib/main_test'

$coordinates = ''
a = TicTacToe.new
name1 = 'ilhan'
name2 = 'felipe'

RSpec.describe TicTacToe do
  describe '#initialize' do
    it 'assigns name to a player' do
      expect(name1).to eql('ilhan')
      expect(name2).to eql('felipe')
    end
  end

  describe '#return_table' do
    it 'setup the board' do
      expect(a.return_table).to eql([[0, 0, 0], [0, 0, 0], [0, 0, 0]])
    end
  end

  describe '#winner' do
    let(:arrs) { %w[00 01 02] }
    it 'winner' do
      a.setting_table([[0, 0, 0], [0, 0, 0], [0, 0, 0]])
      i = 0
      while i < arrs.length
        $coordinates = arrs[i]
        a.move(2)
        i += 1
      end
      expect(a.winner(name2)).to eql(true)
    end
  end

  describe '#draw' do
    it 'draw' do
      a.setting_table([[1, 1, 2], [2, 2, 1], [1, 2, 0]])
      $coordinates = '22'
      a.move(1)
      a.setting_count(9)
      expect(a.draw).to eql(true)
    end
  end

  describe '#move' do
    it 'wrong move' do
      $coordinates = '45'
      a.move(1)
      expect(a.move(1)).to eql(a.move_is_wrong)
    end
  end
end

# rubocop: enable Style/GlobalVars
