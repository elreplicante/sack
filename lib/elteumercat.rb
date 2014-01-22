require 'sinatra/base'

class Sack < Sinatra::Base
  get '/' do
    'Hello Sack!'
  end
end
