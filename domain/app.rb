require_relative 'release'

class App
  attr_accessor :name, :production, :staging

  def initialize(name, production_id, staging_id)
    self.name = name
    self.production = Release.new(production_id)
    self.staging = Release.new(staging_id)
  end
end
