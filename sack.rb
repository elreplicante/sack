require 'sinatra/base'
require 'mongoid'

class Sack < Sinatra::Base

  configure do
    Mongoid.load!('mongoid.yml')
  end

  get '/' do
    erb :index
  end
end
