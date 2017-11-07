class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: :release_year, message: "only once a year"}
  validates :release_year, presence: true, if: :released?
  validates :release_year, numericality: {less_than_or_equal_to: 2017}, allow_nil: true
end
