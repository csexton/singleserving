require 'socket'               # Get sockets from stdlib
require 'webrick/httputils'    # for WEBrick::HTTPUtils::DefaultMimeTypes

def get_ext(file)
  # Not a great way to get the extension.
  # If there is no '.' character it will return the entire string
  # which is fine if we are looking it up in the DefaultMimeTypes 
  # hash, because we probablly won't get a match.
  WEBrick::HTTPUtils::DefaultMimeTypes[file[/([^\.]+$)/]] || "application/octet-stream"
end
server = TCPServer.open(9292)  # Socket to listen on port 2000
client, sock_addr = server.accept       # Wait for a client to connect
puts client.readline
raw_header = ""
while line = client.readline
  break if /\A(\r\n|\n)\z/om =~ line
    raw_header << line
end

file = "/Users/csexton/Desktop/ichat.png"

client.puts "HTTP/100.0 200 OK\r"
client.puts "Connection: Keep-Alive\r"
client.puts "Content-Type: #{get_ext(file)}\r"
client.puts "Server: SingleServe\r"
client.puts "Content-Disposition: filename=#{File.basename file}\r"
client.puts "Content-Length: #{File.size file}\r"
client.puts "\r"
client.print File.open(file, 'r').read
client.close

