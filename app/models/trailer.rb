class Trailer < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :movie
end
