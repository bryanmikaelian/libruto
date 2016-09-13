require 'sinatra'
require 'statsd'

$statsd = Statsd.new '127.0.0.1', 8125

class Libruto < Sinatra::Base
  get '/' do
    $statsd.increment 'bryan.tests#application=sinatra,ruby=2.4.beta', 1
    $statsd.increment 'bryan.tests#application=sinatra,ruby=2.2.3', 1
    $statsd.increment 'bryan.tests#application=sinatra,ruby=2.3.1', 1
    $statsd.increment 'bryan.tests#application=sinatra,ruby=1.9.3', 1
    $statsd.gauge 'bryan.tests#application=sinatra,ruby=1.9.3,action=index', 4
    'Libruto'
  end
end
