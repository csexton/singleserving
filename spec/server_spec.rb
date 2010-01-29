require 'stringio'
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Server" do
  before(:all) do
    @buffer = StringIO.new
    @tcp_server= mock(TCPServer, :accept => @buffer, :puts => true)
    TCPServer.stub!(:open).and_return(@tcp_server)

    @s = SingleServing::Server.new
  end

  it "should server a page" do
    @s.serve(__FILE__, 9292)
    puts @buffer.string
  end
  it "should get the file type" do
    @s.get_ext("/Users/c.sexton/Desktop/Cool-Cucumber.png").should == "image/png"
  end
end
