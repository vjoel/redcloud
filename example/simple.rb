# An example to motivate further development of redcloud.

require 'redshift'

include RedShift

class Client < Component
  continuous :request_rate # req per second

  flow do
    diff " t' = 1 "
    alg  " request_rate = fmax(0, 100*sin(t)) "
      # generate some spiky, cyclic demand
  end
end

class Server < Component
  link client: Client
  continuous :capacity  # req per second handled by server
  continuous :backlog   # number of req not yet handled

  flow do
    diff " backlog' = client.request_rate - capacity "
  end
  
  transition do
    guard " backlog < 0 "
    reset :backlog => 0
  end
end

w = World.new
w.time_step = 0.01

client = w.create(Client)
server = w.create(Server) {|s|
  s.client = client
  s.capacity = 50.0
}

backlog = [[w.clock, server.backlog]]

w.evolve 20.0 do
  backlog << [[w.clock, server.backlog]]
end

if ARGV.delete('-p')
  require 'redshift/util/plot'
  include Plot::PlotUtils

  gnuplot do |plot|
    plot.add backlog, 'title "backlog" with lines'
  end
else
  puts "use -p switch to show plot"
end
