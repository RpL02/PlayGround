class Article < ActiveRecord::Base
	#remove_index :comments, ["user_id"]

	# PrettyUrls
	extend FriendlyId
	friendly_id :title, use: [:slugged, :finders, :history]

	# Files
	has_attached_file :cover, styles: {medium:"1280x720"}

	# Validations
	validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
	validates :title, presence: true
	validates :body, presence: true

	# Relations
	has_many :comments, as: :commentable
	belongs_to :user
	
	def should_generate_new_friendly_id?
		slug.blank? || title_changed?
	end
end
