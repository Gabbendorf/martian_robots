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

  it "remembers the scent of robot lost" do
    mars = Mars.new(4)

    lost_robot = MartianRobot.new([2,2], "W", mars)
    lost_robot.report_final_position('FLFRFFF')
    last_position = lost_robot.last_position_before_lost
    scent = mars.remember_scent(last_position)

    lost_robot = MartianRobot.new([2,2], "N", mars)
    lost_robot.report_final_position('FRFLFFFF')
    last_position = lost_robot.last_position_before_lost
    scent = mars.remember_scent(last_position)

    lost_robot = MartianRobot.new([2,2], "E", mars)
    lost_robot.report_final_position('FRFFFF')
    last_position = lost_robot.last_position_before_lost
    scent = mars.remember_scent(last_position)

    expect(scent).to eq([[0,1], [3,4], [3,0]])
  end

end
