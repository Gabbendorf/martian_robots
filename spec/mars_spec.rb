$LOAD_PATH << File.expand_path('. ./lib', __FILE__)

require 'mars'

RSpec.describe Mars do

  it "has a size" do
    mars = Mars.new(5)
    expect(mars.size).to eq(5)
  end

  it "has to be bigger than 0x0" do
    expect{Mars.new(0)}.to raise_error(ArgumentError)
  end

  it "has to be an integer" do
    expect{Mars.new("five")}.to raise_error(ArgumentError)
  end

end
