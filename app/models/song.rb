class Song < ActiveRecord::Base
  validates :title, length: {minimum: 1}
  validates :title, uniqueness: { scope: [:artist_name, :release_year]}
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true,
    unless: Proc.new { |a| a.released == false},
    numericality: {less_than_or_equal_to: Time.now.year}
  validates :artist_name, length: {minimum: 1}

end
