ActiveAdmin.register Movie do
	scope :published
	scope :unpublished
	index do
		column "Original", :original_title
		column :title		
		column "Created", :created_at
		column :published
		default_actions
	end


end
