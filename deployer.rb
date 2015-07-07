require 'sinatra/base'

require_relative 'domain/app'

class Deployer < Sinatra::Base
  helpers do
    def humanize(released_at)
      secs = Time.now - DateTime.parse(released_at).to_time
      [[60, :seconds], [60, :minutes], [24, :hours], [1000, :days]].map{ |count, name|
        if secs > 0
          secs, n = secs.divmod(count)
          "#{n.to_i} #{name}"
        end
      }.compact.reverse.join(' ')
    end
  end

  get '/' do
    @apps = [
      App.new('Pension Guidance', 'fam5deeg2ob7das1yet8dyerr5ye4b', 'ggp-pension-guidance'),
      App.new('Output Document', 'output-pensionwise', 'staging-output-pensionwise'),
      App.new('Locator', 'locator-pensionwise', 'staging-locator-pensionwise')
    ]
    erb :index
  end
end
