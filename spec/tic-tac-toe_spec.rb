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
	    expect(a.return_table).to eql([[1,1,2],[2,2,1],[0,0,1]])
	  end
	end
	describe "#winner" do
		it "winner" do
		$coordinates = "20"
		a.move(2)
		a.put_table
		expect(a.winner(name1)).to eql(true)
		end
	end
	
end

	
