require_relative '../lib/martian_robot'
require_relative '../lib/mars'

RSpec.describe MartianRobot do

  let (:mars) {Mars.new(10)}

  it "returns [2,1] if robot starts from [1,1] 'E' and receives 'F'" do
    robot = MartianRobot.new([1,1], "E", mars)
    expect(robot.report_final_position('F')).to eq([2,1])
  end

  it "returns [0,1] if robot starts from [1,1] 'W' and receives 'F'" do
    robot = MartianRobot.new([1,1], "W", mars)
    expect(robot.report_final_position('F')).to eq([0,1])
  end

  it "returns [1,2] if robot starts from [1,1] 'N' and receives 'F'" do
    robot = MartianRobot.new([1,1], "N", mars)
    expect(robot.report_final_position('F')).to eq([1,2])
  end

  it "returns [4,3] if robot starts from [4,4] 'S' and receives 'F'" do
    robot = MartianRobot.new([4,4], "S", mars)
    expect(robot.report_final_position('F')).to eq([4,3])
  end

  it "returns [4,2] if robot starts from [4,4] 'S' and receives 'FF'" do
    robot = MartianRobot.new([4,4], "S", mars)
    expect(robot.report_final_position('FF')).to eq([4,2])
  end

  it "returns [1,3] if robot starts from [1,1] 'N' and receives 'FF'" do
    robot = MartianRobot.new([1,1], "N", mars)
    expect(robot.report_final_position('FF')).to eq([1,3])
  end

  it "returns [0,3] if robot starts from [3,3] 'W' and receives 'FFF'" do
    robot = MartianRobot.new([3,3], "W", mars)
    expect(robot.report_final_position('FFF')).to eq([0,3])
  end

  it "returns [5,1] if robot starts from [1,1] 'E' and receives 'FFFF'" do
    robot = MartianRobot.new([1,1], "E", mars)
    expect(robot.report_final_position('FFFF')).to eq([5,1])
  end

  it "returns [2,2] if robot starts from [1,1] 'N' and receives 'FRF'" do
    robot = MartianRobot.new([1,1], "N", mars)
    expect(robot.report_final_position("FRF")).to eq([2,2])
  end

  it "returns [2,1] if robot starts from [2,2] 'S' and receives 'FFRRF'" do
    robot = MartianRobot.new([2,2], "S", mars)
    expect(robot.report_final_position("FFRRF")).to eq([2,1])
  end

  it "returns [2,2] if robot starts from [1,1] 'E' and receives 'FLF'" do
    robot = MartianRobot.new([1,1], "E", mars)
    expect(robot.report_final_position("FLF")).to eq([2,2])
  end

  it "returns [0,3] if robot starts from [1,1] 'S' and receives 'LLFFLF'" do
    robot = MartianRobot.new([1,1], "S", mars)
    expect(robot.report_final_position("LLFFLF")).to eq([0,3])
  end

  it "returns [3,0] if robot starts from [1,1] 'E' and receives 'FRFLF'" do
    robot = MartianRobot.new([1,1], "E", mars)
    expect(robot.report_final_position("FRFLF")).to eq([3,0])
  end

  it "returns [1,3] if robot starts from [1,1] 'N' and receives 'FRLF'" do
    robot = MartianRobot.new([1,1], "N", 5)
    expect(robot.report_final_position("FRLF")).to eq([1,3])
  end

  it "returns [0,3] if robot starts from [2,2] 'W' and receives 'FRFLFRRL'" do
    robot = MartianRobot.new([2,2], "W", mars)
    final_position = robot.report_final_position("FRFLFRRL")
    expect(final_position).to eq([0,3])
  end

  describe "Robot gets lost" do
    it "returns :lost if robot final position is outside the limits" do
      mars = Mars.new(1)
      robot = MartianRobot.new([1,1], "E", mars)
      final_position = robot.report_final_position('F')
      expect(final_position).to eq(:lost)
    end

    it "returns :lost if robot final position is outside the limits" do
      mars = Mars.new(3)
      robot = MartianRobot.new([1,1], "W", mars)
      expect(robot.report_final_position('FFFF')).to eq(:lost)
    end

    it "returns :lost if robot final position is outside the limits" do
      mars = Mars.new(3)
      robot = MartianRobot.new([1,1], "N", mars)
      expect(robot.report_final_position('FFFF')).to eq(:lost)
    end

    it "returns :lost if robot final position is outside the limits" do
      mars = Mars.new(3)
      robot = MartianRobot.new([1,1], "S", mars)
      expect(robot.report_final_position('FFFF')).to eq(:lost)
    end

    it "returns :lost if robot gets back inside the confines once it got out" do
      mars = Mars.new(3)
      robot = MartianRobot.new([1,1], "N", mars)
      expect(robot.report_final_position('FFFRRFFF')).to eq(:lost)
    end
  end

  describe "Robot leaves scent when gets off the confines" do
    it "leaves its scent on the spot before getting off the confines and returns coordinates of that spot" do
      mars = Mars.new(4)
      lost_robot = MartianRobot.new([1,1], "N", mars)
      lost_robot.report_final_position('FRFLFRFFFF')
      expect(lost_robot.last_position_before_lost).to eq([4,3])
    end

    it "leaves its scent on the spot in planet before getting off the confines and returns coordinates of that spot" do
      mars = Mars.new(4)
      lost_robot = MartianRobot.new([2,2], "E", mars)
      lost_robot.report_final_position('FRFFFF')
      expect(lost_robot.last_position_before_lost).to eq([3,0])
    end

    it "leaves its scent on the spot in planet before getting off the confines and returns coordinates of that spot" do
      mars = Mars.new(4)
      lost_robot = MartianRobot.new([2,2], "W", mars)
      lost_robot.report_final_position('FLFRFFF')
      expect(lost_robot.last_position_before_lost).to eq([0,1])
    end

    it "leaves its scent on the spot in planet before getting off the confines and returns coordinates of that spot" do
      mars = Mars.new(4)
      lost_robot = MartianRobot.new([2,2], "N", mars)
      lost_robot.report_final_position('FRFLFFFF')
      expect(lost_robot.last_position_before_lost).to eq([3,4])
    end
  end

  it "leaves its scent and Mars adds it" do
    mars = Mars.new(4)
    lost_robot = MartianRobot.new([2,2], "N", mars)
    last_position = lost_robot.report_final_position('FRFLFFFF')
    mars.remember_scent(last_position)
    expect(mars.scent?(last_position)).to eq(true)
  end

  describe "The robot knows if another robot got lost from same point before " do
    it "stops and returns current position if after this another robot got lost from this position before" do
      mars = Mars.new(4)
      robot = MartianRobot.new([2,2], "N", mars)
      robot.report_final_position('FFF')
      new_robot = MartianRobot.new([1,1], "N", mars)
      position = new_robot.report_final_position('FRFLFFF')
      expect(position).to eq([2,4])
    end

    it "stops and returns current position if after this another robot got lost from this position before" do
      mars = Mars.new(4)
      first_robot = MartianRobot.new([2,2], "N", mars)
      first_robot.report_final_position('FFF')
      second_robot = MartianRobot.new([1,1], "N", mars)
      second_robot.report_final_position('FRFLFFF')
      third_robot = MartianRobot.new([2,3], "N", mars)
      position = third_robot.report_final_position('FF')
      expect(position).to eq([2,4])
    end

    it "returns :lost if it gets off the confines and no other robot left its scent on the same position before" do
      mars = Mars.new(4)
      robot = MartianRobot.new([2,2], "N", mars)
      robot.report_final_position('FFF')
      new_robot = MartianRobot.new([2,3], "N", mars)
      position = new_robot.report_final_position('FRFLFFF')
      expect(position).to eq(:lost)
    end
  end

end
