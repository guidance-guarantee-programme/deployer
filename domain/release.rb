class Release
  def initialize(app_id)
    self.app_id = app_id
  end

  def slug
    release['slug']['id']
  end

  def released_at
    release['created_at']
  end

  private

  attr_accessor :app_id

  def release
    @release ||= $heroku.release.list(app_id).first
  end
end
