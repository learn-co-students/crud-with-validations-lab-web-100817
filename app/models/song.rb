class Song < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :genre
  validates_presence_of :artist_name
  validates_inclusion_of :released, in: [true, false]
  validate :rel_year
  validates_uniqueness_of :title, scope: [:release_year, :artist_name]
  # validates_uniqueness_of :title, scope: :artist_id
  def rel_year
    if self.released
      if !self.release_year
        self.errors.add(:release_year, 'Tell Me WHEN, Fool.')
      elsif self.release_year > Time.now.year
        self.errors.add(:release_year, 'no future music')
      end
    end
  end

  def doubles
    self.artist
  end

end
