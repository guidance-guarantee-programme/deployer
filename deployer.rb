require 'sinatra/base'

require_relative 'domain/app'

class Deployer < Sinatra::Base
  get '/' do
    @apps = [
      App.new('Pension Guidance', 'fam5deeg2ob7das1yet8dyerr5ye4b', 'ggp-pension-guidance'),
      App.new('Output Document', 'output-pensionwise', 'staging-output-pensionwise'),
      App.new('Locator', 'staging-locator-pensionwise', 'locator-pensionwise')
    ]
    erb :index
  end
end
