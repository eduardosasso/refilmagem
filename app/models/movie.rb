class Movie < ActiveRecord::Base
  attr_accessible :original_title, :title, :description, :genre_id, :duration, :age_rating, :format, :release_year, :published
	has_many :trailers
	belongs_to :genre

	scope :published, where(published: true)  
	scope :unpublished, where(published: false)

end
