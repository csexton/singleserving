require "#{File.dirname(__FILE__)}/singleserving/system_utils"
require "#{File.dirname(__FILE__)}/singleserving/server"


module SingleServing
  def self.version
    "#{File.open("#{File.dirname(__FILE__)}/../VERSION", "r").read}"
  end
  def self.serve(file, options)
    url = "http://#{SystemUtils.ip_address}:#{options[:port]}/#{File.basename file}" # <-- Ugly, eh?
    SystemUtils.pbcopy(url)
    puts "Serving #{url}"

    Server.new.serve(file, options[:port])
  end
end
