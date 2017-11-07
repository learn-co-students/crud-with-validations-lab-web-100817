class Song < ActiveRecord::Base
  validates(:title, :artist_name, presence: true)
  validates_uniqueness_of(:title, scope: [:release_year])
  validates :release_year, presence: true, if: :released
  validates(:released, inclusion: { in: [true, false] })
  validates(:release_year, inclusion: { in: 1900..Time.now.year },allow_nil: true)
end
