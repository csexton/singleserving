require 'rackable'
require 'socket'
require "#{File.dirname(__FILE__)}/singleserving/system_utils"


module SingleServing
  def self.version
    "#{File.open("#{File.dirname(__FILE__)}/../VERSION", "r").read}"
  end
  def self.serve(file, options)
    puts "ut prosem"
    run HelloWorld.new
  end
end
