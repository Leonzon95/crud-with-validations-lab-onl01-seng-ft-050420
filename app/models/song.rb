class Song < ApplicationRecord
    validates :title, :artist_name, presence: true
    validates :title, uniqueness: {scope: [:release_year, :artist_name]}
    # validates :release_year, numericality: {less_than_or_equal_to: Time.zone.now.year}
    include ActiveModel::Validations
    validates_with ReleaseYearValidator
end
