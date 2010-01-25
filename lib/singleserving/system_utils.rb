require 'socket'

module SingleServing
  class SystemUtils
    def self.ip_address
      UDPSocket.open {|s| s.connect('4.4.4.4', 1); s.addr.last}
    end

    def self.hostname
      Socket.gethostname
    end
  end
end
