$LOAD_PATH << File.expand_path('. ./lib', __FILE__)

require 'movements'

RSpec.describe Movements do

  let (:movements) {Movements.new}

  describe "Robot turns clockwise" do
    it "returns E if robot's initial orientation is N" do
      expect(movements.change_orientation_clockwise("N")).to eq("E")
    end

    it "returns W if robot's initial orientation is S" do
      expect(movements.change_orientation_clockwise("S")).to eq("W")
    end
  end

  describe "Robot turns anticlockwise" do
    it "returns S if robot's initial orientation is W" do
      expect(movements.change_orientation_anticlockwise("W")).to eq("S")
    end

    it "returns N if robot's initial orientation is E" do
      expect(movements.change_orientation_anticlockwise("E")).to eq("N")
    end
  end

  describe "Robot moves forward" do
    it "returns 2 as value for coordinate x if robot starts from [1,1] and moves East" do
      coordinates = [1,1]
      movements.move_forward('E',coordinates)
      expect(coordinates[0]).to eq(2)
    end

    it "returns 2 as value for coordinate y if robot starts from [1,1] and moves North" do
      coordinates = [1,1]
      movements.move_forward('N',coordinates)
      expect(coordinates[1]).to eq(2)
    end

    it "returns 4 as value for coordinate x if robot starts from [5,3] and moves West" do
      coordinates = [5,3]
      movements.move_forward('W',coordinates)
      expect(coordinates[0]).to eq(4)
    end

    it "returns 8 as value for coordinate y if robot starts from [7,9] and moves South" do
      coordinates = [7,9]
      movements.move_forward('S',coordinates)
      expect(coordinates[1]).to eq(8)
    end
  end
  
end
