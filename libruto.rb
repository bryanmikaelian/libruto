require 'sinatra'
require 'librato-statsd-ruby'

$statsd = Statsd.new '127.0.0.1', 8125

class Libruto < Sinatra::Base
  get '/' do
    $statsd.increment 'bryan.tests', 1, tags: { application: 'sinatra', ruby: '2.4.1.beta' }
    $statsd.increment 'bryan.tests', 1, tags: { application: 'sinatra', ruby: '2.3.3' }
    $statsd.increment 'bryan.tests', 1, tags: { application: 'sinatra', ruby: '1.9.3' }
    $statsd.increment 'bryan.tests', 1, tags: { application: 'sinatra', ruby: '2.2.3' }
    'Libruto'
  end
end
