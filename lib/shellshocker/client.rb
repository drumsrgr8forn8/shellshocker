require "dcell"

class ShellShocker::Client
  include Celluloid

  attr_accessor :server, :name

  def initialize(name)
    @name = name
    DCell.start :id => self.name, :addr => "tcp://127.0.0.1:9010"
  end

  def connect
    puts "Attempting to connect to the server"
    @server = DCell::Node[:server]

    @server.connect(self.name)
  end
end

