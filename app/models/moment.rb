class Moment < ActiveRecord::Base
	belongs_to :user
	belongs_to :journal

	validates :description, length: {maximum: 500}

	extend FriendlyId
	friendly_id :title, use: :slugged

	def should_generate_new_friendly_id?
		new_record?
	end
end
