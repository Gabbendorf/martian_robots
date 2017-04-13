$LOAD_PATH << File.expand_path('. ./lib', __FILE__)

require 'mars'

RSpec.describe Mars do

  let (:mars) {Mars.new(@size)}

  it "has to be a square" do
    mars = Mars.new(5)
    expect(mars.length).to eq(5)
    expect(mars.height).to eq(5)
  end

  it "has to be bigger than 0x0" do
    expect{Mars.new(0)}.to raise_error(ArgumentError)
  end


end
