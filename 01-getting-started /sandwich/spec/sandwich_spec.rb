Sandwich = Struct.new(:taste, :toppings)

# follow Arrange/Act/Assert pattern inside the example

# the whole block is called a spec
RSpec.describe "An ideal sandwich" do #example group, defines what we are testing

  let(:sandwich) { Sandwich.new('delicious', []) }

  it "is delicious" do # the block inside is the the "test case"
    # sandwich = Sandwich.new('delicious', [])

    taste = sandwich.taste

    expect(taste).to eql('delicious')
  end

  it "lets me add toppings" do
    # sandwich = Sandwich.new('delicious', [])
    sandwich.toppings << 'cheese'
    toppings = sandwich.toppings

    expect(toppings).not_to be_empty
  end
end
