require_relative '../lib/main_test'


describe "#initialize" do
  it "assigns name to a player" do
    expect(name1).to eql('ilhan')
    expect(name2).to eql('felipe')
  end
end