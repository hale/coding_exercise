require 'spec_helper'

describe "Basic test setup" do
  it "flexmock works" do
    m = flexmock(foo: :bar)
    expect(m.foo).to eq(:bar)
  end
end
