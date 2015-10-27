class Journal < ActiveRecord::Base
	belongs_to :user
	has_many :moments, dependent: :destroy

	extend FriendlyId
	friendly_id :title, use: :slugged

	def should_generate_new_friendly_id?
		new_record?
	end
end
