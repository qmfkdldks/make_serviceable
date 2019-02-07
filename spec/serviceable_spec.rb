class TestService
  include Serviceable
end

RSpec.describe Serviceable do
  it "has a version number" do
    expect(Serviceable::VERSION).not_to be nil
  end

  let(:serivce_class) { TestService }

  it "should add #call to shorten #new." do
    expect(serivce_class).to respond_to(:call)
  end

  context "instantiated" do

  end

end
