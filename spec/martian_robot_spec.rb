#$LOAD_PATH << File.expand_path('../lib', __FILE__)

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

  it "returns [2,0] if robot starts from [2,2] 'S' and receives 'FFFRRF'" do
    robot = MartianRobot.new([2,2], "S", mars)
    expect(robot.report_final_position("FFFRRF")).to eq([2,0])
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

  it "returns [1,0] if robot starts from [1,1] 'W' and receives 'FFRLFLLFFFRRRLLF'" do
    robot = MartianRobot.new([1,1], "W", mars)
    final_position = robot.report_final_position("FFRLFLLFFFRRRLLF")
    expect(final_position).to eq([1,0])
  end

  it "returns :lost if robot final position is outside the limits" do
    mars = Mars.new(2)
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

end
