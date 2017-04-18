$LOAD_PATH << File.expand_path('. ./lib', __FILE__)

require 'mars'

RSpec.describe Mars do

  it "has to be bigger than 0x0" do
    expect{Mars.new(0)}.to raise_error(ArgumentError)
  end


end
