class Song < ActiveRecord::Base
  validates :title, length:{minimum: 1}
  validates :title, uniqueness: { scope: [:release_year, :artist_name],
    message: "should happen once per year" }
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true

  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {
      less_than_or_equal_to: Date.today.year
    }
  end

  def released?
    released
  end

end
