require "dcell"

class ShellShocker::Server
  include Celluloid

  attr_accessor :port

  def initialize(port = 9000)
    puts "Starting ShellShocker Server"
    @port = port
  end

  def connect(name)
    puts "Hi #{name}"
  end
end

DCell.start :id => "server", :addr => "tcp://127.0.0.1:9001"
ShellShocker::Server.supervise_as :server
