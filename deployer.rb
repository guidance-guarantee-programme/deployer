require 'sinatra/base'

class Deployer < Sinatra::Base
  get '/' do
    erb :index
  end
end
