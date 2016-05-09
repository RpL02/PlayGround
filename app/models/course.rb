class Course < ActiveRecord::Base
	
	# PrettyUrls
	extend FriendlyId
    friendly_id :name, use: [:slugged, :finders, :history]

  	# Files
	has_attached_file :cover, styles: {thumb:"400x200", mini: "64x64"}
	has_attached_file :poster, styles: { medium: "1280x720"}

	# CallBacks
	after_create :save_categories

	# Validations
	validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
	validates_attachment_content_type :poster, content_type: /\Aimage\/.*\Z/
	validates :name, presence: true
	validates :description, presence: true


	def should_generate_new_friendly_id?
		slug.blank? || name_changed?
	end
		
	def categories=(categories)
		@categories = categories
	end


	private
	def save_categories
		@categories.each do |category|
			HasCategory.create(category_id: category, course_id: self.id)
		end
	end

end