class Category < ActiveRecord::Base

	#PrettyUrls
	extend FriendlyId
	friendly_id :name, use: [:slugged, :finders, :history]

	#Files
	has_attached_file :cover, styles: {thumb:"400x200", mini: "64x64"}

	#Validations
	validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/

	#RelationShips
	has_many :has_categories
	has_many :courses, through: :has_categories

	def should_generate_new_friendly_id?
		slug.blank? || name_changed?
	end
end
