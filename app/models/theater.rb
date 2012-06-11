class Theater < ActiveRecord::Base
  belongs_to :city
  belongs_to :state
  belongs_to :adapter
end
