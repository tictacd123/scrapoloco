require_relative '../lib/dark_trader'

describe "the return_crypto method" do
  it "should return an not nil array" do
    expect(return_crypto).not_to be_empty
  end

  it "should have BTC, NEO, THR" do
    expect(return_crypto.reduce({}, :merge)).to include("BTC")
    expect(return_crypto.reduce({}, :merge)).to include("NEO")
    expect(return_crypto.reduce({}, :merge)).to include("THR")
  end

  it "should have the price in float and the currencie name in String" do
    expect(return_crypto[3].values[0].class).to eq(Float)
    expect(return_crypto[3].keys[0].class).to eq(String)
  end
end


