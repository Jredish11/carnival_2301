require './lib/visitor'
require './lib/ride'

RSpec.describe Ride do
  before(:each) do
    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')
    @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })

  end

  it 'exists and has attributes' do
    expect(@ride1).to be_instance_of Ride
    expect(@ride1.name).to eq('Carousel')
    expect(@ride1.min_height).to eq(24)
    expect(@ride1.admission_fee).to eq(1)
    expect(@ride1.excitement).to eq(:gentle)
    expect(@ride1.total_revenue).to eq(0)
  end

  it 'has visitors with preferences and adds riders to log' do
    @visitor1.add_preference(:gentle)
    @visitor2.add_preference(:gentle)
    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor2)
    @ride1.board_rider(@visitor1)
    expect(@ride1.rider_log).to eq({@visitor1 => 2, @visitor2 => 1})
  end

  it 'cost money for visitor to ride' do
    expect(@visitor1.spending_money).to eq(8)
    expect(@visitor2.spending_money).to eq(4)
    expect(@ride1.total_revenue).to eq(3)
    expect(@visitor2.add_preference(:thrilling)).to eq([:gentle, :thrilling])
    expect(@visitor3.add_preference(:thrilling)).to eq([:thrilling])
    ride3.board_rider(visitor1)
    ride3.board_rider(visitor2)
    ride3.board_rider(visitor3)
  end




end





#  A rider's spending money is reduced by the admission fee when they board a ride
# # 
# # A rider does not board if they are not tall enough or do not have a matching preference for the ride's excitement level

  # A ride can calculate the total revenue it has earned
# 



# pry(main)> visitor2.add_preference(:thrilling)
# #=> [:gentle, :thrilling]

# pry(main)> visitor3.add_preference(:thrilling)
# #=> [:thrilling]

# pry(main)> ride3.board_rider(visitor1)

# pry(main)> ride3.board_rider(visitor2)

# pry(main)> ride3.board_rider(visitor3)

# pry(main)> visitor1.spending_money
# #=> 8

# pry(main)> visitor2.spending_money
# #=> 4

# pry(main)> visitor3.spending_money
# #=> 13

# pry(main)> ride3.rider_log
# #=> {#<Visitor:0x0000000159a852a0 @height=64, @name="Penny", @preferences=[:thrilling], @spending_money=13>=>1}

# pry(main)> ride3.total_revenue
# #=> 2