$LOAD_PATH << File.expand_path('. ./lib', __FILE__)
# require 'martian_robots'
require 'movements'

RSpec.describe Movements do

  let (:movements) {Movements.new}

  it "returns E if robot's initial orientation is N" do
    expect(movements.change_orientation_clockwise("N")).to eq("E")
  end

  it "returns W if robot's initial orientation is S" do
    expect(movements.change_orientation_clockwise("S")).to eq("W")
  end

  it "returns S if robot's initial orientation is W" do
    expect(movements.change_orientation_anticlockwise("W")).to eq("S")
  end

  it "returns N if robot's initial orientation is E" do
    expect(movements.change_orientation_anticlockwise("E")).to eq("N")
  end


end
