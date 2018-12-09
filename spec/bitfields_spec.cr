require "./spec_helper"

class CrossBit < BitFields
  bf rpms : UInt32, 32
  bf temp : UInt8, 4 
  bf psi : UInt16, 9 
  bf power : UInt8, 1 
  bf lights : UInt8, 2 
end

describe Bitfields do
  crossbit = CrossBit.new(Bytes[109, 121, 110, 97, 109, 245])

  it "should read 32 bits into a UInt32" do
    crossbit.rpms.should eq 1634629997
    crossbit.rpms.class.should eq UInt32
  end

  it "should read first 4 bits into a UInt8" do
    crossbit.temp.should eq 13 
    crossbit.temp.class.should eq UInt8
  end

  it "should read the next 9 bits from across bytes into a UInt16" do
    crossbit.psi.should eq 342 
    crossbit.psi.class.should eq UInt16
  end

  it "should read the next bit into UInt8" do
    crossbit.power.should eq 1 
    crossbit.power.class.should eq UInt8
  end

  it "should read the next 2 bits to end of byte into UInt8" do
    crossbit.lights.should eq 3
    crossbit.lights.class.should eq UInt8
  end
end
