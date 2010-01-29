require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Singleserving" do
  it "should have a version" do
    SingleServing.version.should_not be_nil
  end
end
