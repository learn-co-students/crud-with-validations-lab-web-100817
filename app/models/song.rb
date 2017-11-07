class Song < ActiveRecord::Base
  validates :title, presence: true
  #custom validator -- cannot be repeated by the same artist in the same year
  validates :released, inclusion: { in: [true, false] }
  #custom validator -- optional if released is false, must not be blank if released is true
  validates :release_year, numericality: { less_than_or_equal_to: Time.now.year, only_integer: true }
  validates :artist_name, presence: true
end
