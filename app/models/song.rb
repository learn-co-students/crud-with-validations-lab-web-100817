class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :release_year, presence: true, if: :released?
  validate :expiration_date_cannot_be_in_the_future



    def expiration_date_cannot_be_in_the_future
      if release_year && release_year > Date.today.strftime("%Y").to_i
        errors.add(:release_year, "can't be in the future")
      end
    end
end
