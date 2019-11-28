require_relative '../lib/main_test'


a = TicTacToe.new
a.put_table
a.opening

game_on = true

puts "Player1 name:"
name1 = 'ilhan'
player1 = 1
puts "Player2 name:"
name2 = 'felipe'
player2 = 2
turn = 1

p a.return_table


RSpec.describe TicTacToe do
  describe "#initialize" do
     it "assigns name to a player" do
       expect(name1).to eql('ilhan')
       expect(name2).to eql('felipe')
     end
   end

  describe "#return_table" do
    it "setup the board" do
      expect(a.return_table).to eql([[0,0,0],[0,0,0],[0,0,0]])
    end
  end

   describe "#winner" do
     let(:arrs) { %w[00 01 02] }
			a.put_table
     it "winner" do
			 a.set_table([[0,0,0],[0,0,0],[0,0,0]])
       i=0
			while i<arrs.length
				$coordinates = arrs[i]
				a.move(2)
				a.put_table
        i+=1
			end
       expect(a.winner(name2)).to eql(true)
     end
   end

	describe "#draw" do
		a.put_table
		it "draw" do
			a.set_table([[1,1,2],[2,2,1],[1,2,0]])
			$coordinates = "22"
			a.move(1)
      a.put_table
			a.set_count(9)
			expect(a.draw).to eql(true)
		end
  end

	describe "#move" do
		a.put_table
		it "wrong move" do
			$coordinates = "45"
			a.move(1)
			expect(a.move(1)).to eql(a.move_is_wrong)
		end
	end
end

