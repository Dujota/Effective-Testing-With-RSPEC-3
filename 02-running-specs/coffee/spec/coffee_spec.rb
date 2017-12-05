class Coffee

  def ingredients
    @ingredients ||= []
  end

  def add(ingredient)
    ingredients << ingredient
  end

  def price
    price = 1.00
    if ingredients.include?(:milk)
      price += 0.25
    end
    price
  end

  def color
    ingredients.include?(:milk) ? :light : :dark   # if true return light if false return dark
  end

  def temperture
    ingredients.include?(:milk) ? 190.0 : 205.0
  end

end

RSpec.configure do |config|
  config.filter_run_when_matching(focus: true)
  config.example_status_persistence_file_path = 'spec/examples.txt'
end

RSpec.describe " A cup of Coffee" do
   let(:coffee) { Coffee.new }

   it "costs $1" do
     expect(coffee.price).to eq(1.00)
   end

   context "with milk" do
     before { coffee.add :milk }

     it "costs $1.25" do
       expect(coffee.price).to eql(1.25 )
   end

   it "is light in color" do
     expect(coffee.color).to be(:light)
   end

   it "is cooler than 200 degrees Fahrenheit" do
    expect(coffee.temperture).to be < 200.0
   end
 end
end
