$LOAD_PATH << File.expand_path('. ./lib', __FILE__)
require 'martian_robots'
require 'robot'

RSpec.describe MartianRobots do

    let (:robot) {Robot.new(@coordinates, @orientation)}
    # let(:martian_robots) {MartianRobots.new}

    it "returns [1,1] if robot starts from [1,1] 'N' and receives 'R'" do
      robot = Robot.new([1,1], "N")
      expect(robot.move('R')).to eq([1,1])
    end

    it "returns [1,1] if robot starts from [1,1] 'N' and receives 'L'" do
      robot = Robot.new([1,1], "N")
      expect(robot.move('L')).to eq([1,1])
    end

    it "returns [1,2] if robot starts from [1,1] 'N' and receives 'F'" do
      robot = Robot.new([1,1], "N")
      expect(robot.move('F')).to eq([1,2])
    end

    xit "returns [2,1] if robot starts from [1,1] 'E' and receives 'F'" do
      robot = Robot.new([1,1], "E")
      expect(robot.move('F')).to eq([2,1])
    end

end
