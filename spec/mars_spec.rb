require_relative '../lib/mars'
require_relative '../lib/martian_robot'

RSpec.describe Mars do

  let (:mars) {Mars.new(10)}

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

  describe "Mars remembers points before robots got lost" do
    it "adds the scent of robot lost" do
      scent = [0,1]
      all_scents = mars.remember_scent(scent)
      scent1 = [3,4]
      all_scents = mars.remember_scent(scent1)
      scent2 = [3,0]
      all_scents = mars.remember_scent(scent2)
      expect(all_scents).to eq([[0,1], [3,4], [3,0]])
    end
  end

  describe "Mars knows if after a certain point a robot got lost before" do
    it "returns true if position has scent" do
      mars.remember_scent([1,2])
      expect(mars.scent?([1,2])).to eq(true)
    end

    it "returns true if position has scent" do
      mars.remember_scent([1,2])
      mars.remember_scent([5,7])
      expect(mars.scent?([5,7])).to eq(true)
    end

    it "returns false if position has not scent" do
      mars.remember_scent([1,2])
      mars.remember_scent([5,7])
      expect(mars.scent?([3,7])).to eq(false)
    end
  end

end
