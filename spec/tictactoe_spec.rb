# frozen_string_literal: true

# rubocop: disable Style/GlobalVars

require_relative '../lib/main_test'

$coordinates = ''
a = TicTacToe.new
name1 = 'ilhan'
name2 = 'felipe'

RSpec.describe TicTacToe do
  describe '#initialize' do
	    
	    it 'setup the board' do
	      expect(a.return_table).to eql([[0, 0, 0], [0, 0, 0], [0, 0, 0]])
	    end

	    it 'should return the variable count' do
	      expect(a.return_count).to eql(0)
	    end
	    
  end
 

  describe '#setting_count' do
		it 'should set the variable count' do
	    	expect(a.setting_count(1)).to eql(a.return_count)
	    end
   end

   describe '#put_table' do
		it 'should puts the table' do
	    	expect(a.put_table).to eql(a.return_table)
	    end
   end

   describe '#setting_table' do
		it 'should set the table' do
	    	expect(a.setting_table([[1, 2, 1], [0, 0, 0], [0, 0, 0]])).to eql(a.return_table)
	    end
   end

   describe '#move' do
    it 'should call setmove' do
      a.setting_table([[0, 0, 0], [0, 0, 0], [0, 0, 0]])
      $coordinates = '22'
      expect(a.move(1)).to eql(a.return_count)
    end

    it 'is wrong move' do
      $coordinates = '45'
      a.move(1)
      expect(a.move(1)).to eql(a.move_is_wrong)
    end
  end

   describe '#setmove' do
		it 'should set the move on the table' do
		  a.setting_table([[0, 0, 0], [0, 0, 0], [0, 0, 0]])
		  a.setmove('00', 2)
	      expect(a.return_table).to eql([[2, 0, 0], [0, 0, 0], [0, 0, 0]])
	      p 
	    end
   end

  it 'assigns name to a player' do
      expect(name1).to eql('ilhan')
      expect(name2).to eql('felipe')
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

  describe '#available_cells' do
    it 'return the table cell' do
      expect(a.available_cells).to eql(a.return_table)
    end
  end
end

# rubocop: enable Style/GlobalVars
